.class public final Lc/c/d/b;
.super Ljava/lang/Object;
.source "ActivityStack.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public h:Landroid/app/Activity;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Application;)Lc/c/d/b;
    .registers 2

    .line 1
    new-instance v0, Lc/c/d/b;

    invoke-direct {v0}, Lc/c/d/b;-><init>()V

    .line 2
    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-object v0
.end method


# virtual methods
.method public a()Landroid/app/Activity;
    .registers 2

    .line 3
    iget-object v0, p0, Lc/c/d/b;->h:Landroid/app/Activity;

    return-object v0
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/d/b;->h:Landroid/app/Activity;

    if-eq v0, p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lc/c/d/b;->h:Landroid/app/Activity;

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/d/b;->h:Landroid/app/Activity;

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
