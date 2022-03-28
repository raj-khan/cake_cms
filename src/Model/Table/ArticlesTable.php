<?php

namespace App\Model\Table;

use Cake\ORM\Table;

// the Text class
use Cake\Utility\Text;
// get the query builder instance
use Cake\ORM\Query;

// the EventInterface class
use Cake\Event\EventInterface;
use Cake\Validation\Validator;

class ArticlesTable extends Table
{
    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->notEmptyString('title')
            ->minLength('title', 10)
            ->maxLength('title', 255)
            ->notEmptyString('body')
            ->minLength('body', 10);

        return $validator;
    }


    public function initialize(array $config): void
    {
        $this->addBehavior('Timestamp');
        $this->belongsToMany('Tags');
    }

    public function beforeSave(EventInterface $event, $entity, $options)
    {
        if($entity->tag_string){
            $entity->tags = $this->_buildTags($entity->tag_string);
        }

        if ($entity->isNew() && !$entity->slug) {
            $sluggedTitle = Text::slug($entity->title);
            //trim slug to maximum length defined in schema
            $entity->slug = substr($sluggedTitle, 0, 191);
        }
    }

    protected function _buildTags($tagString){
        // Trim tags
        $newTags = array_map('trim', explode(',', $tagString));

        // Remove all empty tags
        $newTags = array_filter($newTags);

        // Reduce Duplicate tags
        $newTags = array_unique($newTags);

        $out = [];
        $tags = $this->Tags->find()
            ->where(['Tags.title IN ' => $newTags])
            ->all();

        // Remove existing tags from the list of new tags
        foreach($tags->extract('title') as $existing){
            $index = in_array($existing, $newTags);
            if($index !== false){
                unset($newTags[$index]);
            }
        }

        // Add existing tags.
        foreach($tags as $tag){
            $out[] = $tag;
        }

        // Add new tag
        foreach($newTags as $tag){
            $out[] = $this->Tags->newEntity(['title' => $tag]);
        }
        return $out;

    }

    public function findTagged(Query $query, array $options){
        $columns = [
            'Articles.id', 'Articles.user_id', 'Articles.title', 'Articles.body', 'Articles.published', 'Articles.created', 'Articles.slug'
        ];

        $query = $query
                ->select($columns)
                ->distinct($columns);
            if(empty($options['tags'])){
                $query->leftJoinWith('Tags')
                    ->where(['Tags.title IS' => null ]);
            }else{
                $query->innerJoinWith('Tags')
                    ->where(['Tags.title IN' => $options['tags']]);
            }
        return $query->group(['Articles.id']);
    }
}
