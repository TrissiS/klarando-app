.class public Landroidx/lifecycle/ReportFragment;
.super Landroid/app/Fragment;
.source "ReportFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/lifecycle/ReportFragment$b;,
        Landroidx/lifecycle/ReportFragment$a;
    }
.end annotation


# instance fields
.field public h:Landroidx/lifecycle/ReportFragment$a;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Activity;)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_9

    .line 2
    invoke-static {p0}, Landroidx/lifecycle/ReportFragment$b;->registerIn(Landroid/app/Activity;)V

    .line 3
    :cond_9
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v0, "androidx.lifecycle.LifecycleDispatcher.report_fragment_tag"

    .line 4
    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_28

    .line 5
    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    new-instance v2, Landroidx/lifecycle/ReportFragment;

    invoke-direct {v2}, Landroidx/lifecycle/ReportFragment;-><init>()V

    invoke-virtual {v1, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 6
    invoke-virtual {p0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_28
    return-void
.end method

.method public static a(Landroid/app/Activity;Lb/n/e$b;)V
    .registers 3

    .line 7
    instance-of v0, p0, Lb/n/j;

    if-eqz v0, :cond_e

    .line 8
    check-cast p0, Lb/n/j;

    invoke-interface {p0}, Lb/n/j;->a()Lb/n/i;

    move-result-object p0

    invoke-virtual {p0, p1}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void

    .line 9
    :cond_e
    instance-of v0, p0, Lb/n/h;

    if-eqz v0, :cond_21

    .line 10
    check-cast p0, Lb/n/h;

    invoke-interface {p0}, Lb/n/h;->a()Lb/n/e;

    move-result-object p0

    .line 11
    instance-of v0, p0, Lb/n/i;

    if-eqz v0, :cond_21

    .line 12
    check-cast p0, Lb/n/i;

    invoke-virtual {p0, p1}, Lb/n/i;->a(Lb/n/e$b;)V

    :cond_21
    return-void
.end method


# virtual methods
.method public final a(Landroidx/lifecycle/ReportFragment$a;)V
    .registers 2

    if-eqz p1, :cond_5

    .line 13
    invoke-interface {p1}, Landroidx/lifecycle/ReportFragment$a;->a()V

    :cond_5
    return-void
.end method

.method public final a(Lb/n/e$b;)V
    .registers 4

    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_d

    .line 15
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;Lb/n/e$b;)V

    :cond_d
    return-void
.end method

.method public final b(Landroidx/lifecycle/ReportFragment$a;)V
    .registers 2

    if-eqz p1, :cond_5

    .line 1
    invoke-interface {p1}, Landroidx/lifecycle/ReportFragment$a;->b()V

    :cond_5
    return-void
.end method

.method public final c(Landroidx/lifecycle/ReportFragment$a;)V
    .registers 2

    if-eqz p1, :cond_5

    .line 1
    invoke-interface {p1}, Landroidx/lifecycle/ReportFragment$a;->c()V

    :cond_5
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Landroidx/lifecycle/ReportFragment;->h:Landroidx/lifecycle/ReportFragment$a;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/ReportFragment;->a(Landroidx/lifecycle/ReportFragment$a;)V

    .line 3
    sget-object p1, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/ReportFragment;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onDestroy()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 2
    sget-object v0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ReportFragment;->a(Lb/n/e$b;)V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Landroidx/lifecycle/ReportFragment;->h:Landroidx/lifecycle/ReportFragment$a;

    return-void
.end method

.method public onPause()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 2
    sget-object v0, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ReportFragment;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onResume()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 2
    iget-object v0, p0, Landroidx/lifecycle/ReportFragment;->h:Landroidx/lifecycle/ReportFragment$a;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ReportFragment;->b(Landroidx/lifecycle/ReportFragment$a;)V

    .line 3
    sget-object v0, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ReportFragment;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onStart()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 2
    iget-object v0, p0, Landroidx/lifecycle/ReportFragment;->h:Landroidx/lifecycle/ReportFragment$a;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ReportFragment;->c(Landroidx/lifecycle/ReportFragment$a;)V

    .line 3
    sget-object v0, Lb/n/e$b;->ON_START:Lb/n/e$b;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ReportFragment;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onStop()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 2
    sget-object v0, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ReportFragment;->a(Lb/n/e$b;)V

    return-void
.end method
