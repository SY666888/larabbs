<?php

namespace App\Http\Requests;

class ReplyRequest extends Request
{
    public function rules()
    {
        return [
            'content' => 'required|min:2',
        ];
    }

    public function messages()
    {
        return [
            'content.min' => '回复内容q必须至少两个字符',
            'content.required' => '评论内容不能为空！！',
        ];
    }
}
