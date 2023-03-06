<?php 
declare(strict_types=1); //Жесткую типизацию Необходимо писать именно в начале!

ini_set('error_reporting', (string)E_ALL);
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');

class SimpleProduct
{
    protected $id;
    protected $name;
    protected $url;
    protected $price;
    protected $oldPrice;
    protected $currency;
    protected $position;

    public function __construct(
        int $id,
        string $name,
        string $url,
        string $currency,
        float $price,
        float $oldPrice,
        int $position
    ) {
        $this->id       = $id;
        $this->name     = $name;
        $this->url      = $url;
        $this->price    = $price;
        $this->oldPrice = $oldPrice;
        $this->currency = $currency;
        $this->position = $position;
    }
    public function getPosition() {
        return $this->position;
    } 
    public function getId() {
        return $this->id;
    } 
    public function getName() {
        return $this->name;
    } 
    public function getUrl() {
        $this->url=$this->url.'/photo/';
        return $this->url;
    }
    public function getPrice() {
        return $this->price;
    } 
    public function getOldPrice() {
        if (abs($this->oldPrice - $this->price) < 0.0001) {
            return 0;
        }
        else {
            return $this->oldPrice;
        }
    }
    public function getCurrency() {
        return $this->currency;
    }

}
?>
