.class public Landroidx/lifecycle/ReportFragment$b;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/ReportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static registerIn(Landroid/app/Activity;)V
    .registers 2

    .line 1
    new-instance v0, Landroidx/lifecycle/ReportFragment$b;

    invoke-direct {v0}, Landroidx/lifecycle/ReportFragment$b;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityPostCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 1
    sget-object p2, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    invoke-static {p1, p2}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;Lb/n/e$b;)V

    return-void
.end method

.method public onActivityPostResumed(Landroid/app/Activity;)V
    .registers 3

    .line 1
    sget-object v0, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    invoke-static {p1, v0}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;Lb/n/e$b;)V

    return-void
.end method

.method public onActivityPostStarted(Landroid/app/Activity;)V
    .registers 3

    .line 1
    sget-object v0, Lb/n/e$b;->ON_START:Lb/n/e$b;

    invoke-static {p1, v0}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;Lb/n/e$b;)V

    return-void
.end method

.method public onActivityPreDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 1
    sget-object v0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    invoke-static {p1, v0}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;Lb/n/e$b;)V

    return-void
.end method

.method public onActivityPrePaused(Landroid/app/Activity;)V
    .registers 3

    .line 1
    sget-object v0, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    invoke-static {p1, v0}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;Lb/n/e$b;)V

    return-void
.end method

.method public onActivityPreStopped(Landroid/app/Activity;)V
    .registers 3

    .line 1
    sget-object v0, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-static {p1, v0}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;Lb/n/e$b;)V

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
