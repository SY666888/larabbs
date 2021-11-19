<?php

namespace App\Models;

class Reply extends Model
{
    protected $fillable = ['content'];
    //一条回复属于一个话题，一个条回复属于一个作者所有
    public function topic()
    {
        return $this->belongsTo(Topic::class);
    }

    public  function user()
    {
        return $this->belongsTo(User::class);
    }
}
