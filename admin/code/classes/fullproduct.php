<?php 
declare(strict_types=1); //Жесткую типизацию Необходимо писать именно в начале!

ini_set('error_reporting', (string)E_ALL);
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');

class FullProduct extends SimpleProduct
{
    protected $articul;
    protected $notice;
    protected $content;
    protected $section;
    protected $type;

    public function __construct(
        int $id,
        string $name,
        string $url,
        string $currency,
        float $price,
        float $oldPrice,
        int $position,

        string $articul,
        string $notice,
        string $content,
        string $section,
        string $type
    ){
        parent::__construct(
        $id,
        $name,
        $url,
        $currency,
        $price,
        $oldPrice,
        $position
    );
        $this->articul = $articul;
        $this->notice  = $notice;
        $this->content = $content;
        $this->section = $section;
        $this->type    = $type;
    }
    public function getArticul() {
        return $this->articul;
    } 
    public function getNotice() {
        return $this->notice;
    } 
    public function getContent() {
        return $this->content;
    } 
    public function getSection() {
        return $this->section;
    }
    public function getType() {
        return $this->type;
    }
    
}
?>
