<?php

namespace App\Mailer;

use Cake\Mailer\Mailer;

class UserMailer extends Mailer
{
    public function welcome($user)
    {
        $this
            ->setTo($user->email)
            ->setSubject(sprintf('Welcome %s', $user->email))
            ->setAttachments([
                'photo.jpeg' => [
                    'file' => WWW_ROOT.'img/meherul.jpeg',
                    'mimetype' => 'image/jpeg',
                ]
            ]);
    }

    public function resetPassword($user)
    {
        $this
            ->setTo($user->email)
            ->setSubject('Reset password')
            ->setViewVars(['token' => $user->token]);
    }
}