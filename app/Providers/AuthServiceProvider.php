<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
		 \App\Models\Reply::class => \App\Policies\ReplyPolicy::class,
		 \App\Models\Topic::class => \App\Policies\TopicPolicy::class,
        'App\Model' => 'App\Policies\ModelPolicy',
        \App\Models\User::class => \App\Policies\UserPolicy::class,
        /*授权策略定义完成之后，我们便可以在控制器中使用 authorize 方法来检验用户是否授权。默认的
App\Http\Controllers\Controller 控制器基类包含了 Laravel 的 AuthorizesRequests trait。此 trait 提供了
authorize 方法，它可以被用于快速授权一个指定的行为，当无权限运行该行为时会抛出
HttpException。 authorize 方法接收两个参数，第一个为授权策略的名称，第二个为进行授权验证的数据。
        $this->authorize('update', $user);
        这里 update 是指授权类里的 update 授权方法， $user 对应传参 update 授权方法的第二个参数。正如
上面定义 update 授权方法时候提起的，调用时，默认情况下，我们 不需要 传递第一个参数，也就是当前登录用
户至该方法内，因为框架会 自动 加载当前登录用户。

 */
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        \Horizon::auth(function ($request) {
            // 是否是站长
            return \Auth::user()->hasRole('Founder');
        });
    }
}
