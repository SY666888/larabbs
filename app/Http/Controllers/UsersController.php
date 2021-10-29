<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\UserRequest;
use App\Handlers\ImageUploadHandler;
use App\Models\User;
class UsersController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['show']]);//用户必须登录才能访问，除了用户个人页面
        //但是登录后可以修改其它人页面，需要授权策略 policy UserPolicy 用php artisan make:policy UserPolicy 建立
    }

    public function show(User $user)
    {
        return view('users.show', compact('user'));

    }

    public function edit(User $user)
    {
        $this->authorize('update', $user);//用户授权

        return view('users.edit', compact('user'));
    }

    public function update(UserRequest $request, ImageUploadHandler $uploader, User $user)
    {
        $this->authorize('update', $user);//用户授权

        $data = $request->all();
        if ($request->avatar) {
            $result = $uploader->save($request->avatar, 'avatars', $user->id, 416);
            if ($result) {
                $data['avatar'] = $result['path'];
            }
        }
        $user->update($data);

        return redirect()->route('users.show', $user->id)->with('success', '个人资料更新成功！');

    }
}
