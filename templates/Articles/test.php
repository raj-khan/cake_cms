<?php
header('Content-Type:text/plain');

$myText = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur doloremque doloribus dolorum incidunt libero maxime nesciunt numquam, odio officia possimus quas quisquam recusandae, reiciendis tempore vero vitae voluptas voluptate. Ab adipisci aliquam, amet architecto blanditiis delectus dolor dolorem doloremque ducimus eaque error eveniet ex excepturi facere hic impedit iste iusto magnam minima minus nam nesciunt nisi placeat possimus praesentium info@raajkhan.com quaerat quas suscipit meherullah97@gmail.com Corporis cum ea ex harum laborum, libero minima necessitatibus, neque nesciunt numquam tempora voluptatibus? Accusamus animi aspernatur corporis ea eius ex exercitationem explicabo fugiat ipsa natus quasi quidem quisquam www.raj-khan.github.io quod repellat, mukrbd@gmail.com repellendus reprehenderit voluptas? Saepe?";
//$autoLinkEmails = $this->Text->autoLinkEmails($myText);
echo $this->Text->autoLink($myText);



