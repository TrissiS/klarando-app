.class public final Lc/c/d/j;
.super Ljava/lang/Object;
.source "WindowLifecycle.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public h:Landroid/app/Activity;

.field public i:Lc/c/d/g;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/c/d/j;->h:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public a()Landroid/app/Activity;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/d/j;->h:Landroid/app/Activity;

    return-object v0
.end method

.method public a(Lc/c/d/g;)V
    .registers 4

    .line 2
    iput-object p1, p0, Lc/c/d/j;->i:Lc/c/d/g;

    .line 3
    iget-object p1, p0, Lc/c/d/j;->h:Landroid/app/Activity;

    if-nez p1, :cond_7

    return-void

    .line 4
    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_11

    .line 5
    invoke-virtual {p1, p0}, Landroid/app/Activity;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_18

    .line 6
    :cond_11
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :goto_18
    return-void
.end method

.method public b()V
    .registers 4

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lc/c/d/j;->i:Lc/c/d/g;

    .line 2
    iget-object v0, p0, Lc/c/d/j;->h:Landroid/app/Activity;

    if-nez v0, :cond_8

    return-void

    .line 3
    :cond_8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_12

    .line 4
    invoke-virtual {v0, p0}, Landroid/app/Activity;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_19

    .line 5
    :cond_12
    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :goto_19
    return-void
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/d/j;->h:Landroid/app/Activity;

    if-eq v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object p1, p0, Lc/c/d/j;->i:Lc/c/d/g;

    if-eqz p1, :cond_c

    .line 3
    invoke-virtual {p1}, Lc/c/d/g;->a()V

    .line 4
    :cond_c
    invoke-virtual {p0}, Lc/c/d/j;->b()V

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lc/c/d/j;->h:Landroid/app/Activity;

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/d/j;->h:Landroid/app/Activity;

    if-eq v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object p1, p0, Lc/c/d/j;->i:Lc/c/d/g;

    if-nez p1, :cond_a

    return-void

    .line 3
    :cond_a
    invoke-virtual {p1}, Lc/c/d/g;->a()V

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method
