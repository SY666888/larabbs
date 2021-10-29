<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    public function update(User $currentUser, User $user)
    {
         //$currentUser 为当前登录用户实例，$user要进行授权的用户实例
        return $currentUser->id === $user->id;
        //当两个 id相同时，则代表两个用户是相同用户，用户通过授权，
        //如果 id 不相同的话，将抛出 403 异常
        //接下来我们还需要在 AuthServiceProvider 类中对授权策略进行注册
    }
}
