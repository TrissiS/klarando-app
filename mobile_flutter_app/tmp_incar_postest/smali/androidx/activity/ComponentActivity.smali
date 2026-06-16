.class public Landroidx/activity/ComponentActivity;
.super Landroidx/core/app/ComponentActivity;
.source "ComponentActivity.java"

# interfaces
.implements Lb/n/h;
.implements Lb/n/t;
.implements Lb/q/c;
.implements Lb/a/c;
.implements Lb/a/e/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/activity/ComponentActivity$e;
    }
.end annotation


# instance fields
.field public final i:Lb/a/d/a;

.field public final j:Lb/n/i;

.field public final k:Lb/q/b;

.field public l:Lb/n/s;

.field public final m:Landroidx/activity/OnBackPressedDispatcher;

.field public n:I

.field public final o:Lb/a/e/c;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Landroidx/core/app/ComponentActivity;-><init>()V

    .line 2
    new-instance v0, Lb/a/d/a;

    invoke-direct {v0}, Lb/a/d/a;-><init>()V

    iput-object v0, p0, Landroidx/activity/ComponentActivity;->i:Lb/a/d/a;

    .line 3
    new-instance v0, Lb/n/i;

    invoke-direct {v0, p0}, Lb/n/i;-><init>(Lb/n/h;)V

    iput-object v0, p0, Landroidx/activity/ComponentActivity;->j:Lb/n/i;

    .line 4
    invoke-static {p0}, Lb/q/b;->a(Lb/q/c;)Lb/q/b;

    move-result-object v0

    iput-object v0, p0, Landroidx/activity/ComponentActivity;->k:Lb/q/b;

    .line 5
    new-instance v0, Landroidx/activity/OnBackPressedDispatcher;

    new-instance v1, Landroidx/activity/ComponentActivity$a;

    invoke-direct {v1, p0}, Landroidx/activity/ComponentActivity$a;-><init>(Landroidx/activity/ComponentActivity;)V

    invoke-direct {v0, v1}, Landroidx/activity/OnBackPressedDispatcher;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroidx/activity/ComponentActivity;->m:Landroidx/activity/OnBackPressedDispatcher;

    .line 6
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 7
    new-instance v0, Landroidx/activity/ComponentActivity$b;

    invoke-direct {v0, p0}, Landroidx/activity/ComponentActivity$b;-><init>(Landroidx/activity/ComponentActivity;)V

    iput-object v0, p0, Landroidx/activity/ComponentActivity;->o:Lb/a/e/c;

    .line 8
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->a()Lb/n/e;

    move-result-object v0

    if-eqz v0, :cond_8a

    .line 9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_47

    .line 10
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->a()Lb/n/e;

    move-result-object v0

    new-instance v2, Landroidx/activity/ComponentActivity$3;

    invoke-direct {v2, p0}, Landroidx/activity/ComponentActivity$3;-><init>(Landroidx/activity/ComponentActivity;)V

    invoke-virtual {v0, v2}, Lb/n/e;->a(Lb/n/g;)V

    .line 11
    :cond_47
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->a()Lb/n/e;

    move-result-object v0

    new-instance v2, Landroidx/activity/ComponentActivity$4;

    invoke-direct {v2, p0}, Landroidx/activity/ComponentActivity$4;-><init>(Landroidx/activity/ComponentActivity;)V

    invoke-virtual {v0, v2}, Lb/n/e;->a(Lb/n/g;)V

    .line 12
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->a()Lb/n/e;

    move-result-object v0

    new-instance v2, Landroidx/activity/ComponentActivity$5;

    invoke-direct {v2, p0}, Landroidx/activity/ComponentActivity$5;-><init>(Landroidx/activity/ComponentActivity;)V

    invoke-virtual {v0, v2}, Lb/n/e;->a(Lb/n/g;)V

    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v1, v0, :cond_73

    const/16 v1, 0x17

    if-gt v0, v1, :cond_73

    .line 14
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->a()Lb/n/e;

    move-result-object v0

    new-instance v1, Landroidx/activity/ImmLeaksCleaner;

    invoke-direct {v1, p0}, Landroidx/activity/ImmLeaksCleaner;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Lb/n/e;->a(Lb/n/g;)V

    .line 15
    :cond_73
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->c()Landroidx/savedstate/SavedStateRegistry;

    move-result-object v0

    new-instance v1, Landroidx/activity/ComponentActivity$c;

    invoke-direct {v1, p0}, Landroidx/activity/ComponentActivity$c;-><init>(Landroidx/activity/ComponentActivity;)V

    const-string v2, "android:support:activity-result"

    invoke-virtual {v0, v2, v1}, Landroidx/savedstate/SavedStateRegistry;->a(Ljava/lang/String;Landroidx/savedstate/SavedStateRegistry$b;)V

    .line 16
    new-instance v0, Landroidx/activity/ComponentActivity$d;

    invoke-direct {v0, p0}, Landroidx/activity/ComponentActivity$d;-><init>(Landroidx/activity/ComponentActivity;)V

    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->a(Lb/a/d/b;)V

    return-void

    .line 17
    :cond_8a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "getLifecycle() returned null in ComponentActivity\'s constructor. Please make sure you are lazily constructing your Lifecycle in the first call to getLifecycle() rather than relying on field initialization."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic a(Landroidx/activity/ComponentActivity;)V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method public static synthetic b(Landroidx/activity/ComponentActivity;)Lb/a/e/c;
    .registers 1

    .line 1
    iget-object p0, p0, Landroidx/activity/ComponentActivity;->o:Lb/a/e/c;

    return-object p0
.end method


# virtual methods
.method public a()Lb/n/e;
    .registers 2

    .line 3
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->j:Lb/n/i;

    return-object v0
.end method

.method public final a(Lb/a/d/b;)V
    .registers 3

    .line 2
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->i:Lb/a/d/a;

    invoke-virtual {v0, p1}, Lb/a/d/a;->a(Lb/a/d/b;)V

    return-void
.end method

.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1    # Landroid/view/View;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness",
                "MissingNullability"
            }
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness",
                "MissingNullability"
            }
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->j()V

    .line 2
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final b()Landroidx/activity/OnBackPressedDispatcher;
    .registers 2

    .line 2
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->m:Landroidx/activity/OnBackPressedDispatcher;

    return-object v0
.end method

.method public final c()Landroidx/savedstate/SavedStateRegistry;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->k:Lb/q/b;

    invoke-virtual {v0}, Lb/q/b;->a()Landroidx/savedstate/SavedStateRegistry;

    move-result-object v0

    return-object v0
.end method

.method public final d()Lb/a/e/c;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->o:Lb/a/e/c;

    return-object v0
.end method

.method public g()Lb/n/s;
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 2
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->i()V

    .line 3
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->l:Lb/n/s;

    return-object v0

    .line 4
    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Your activity is not yet attached to the Application instance. You can\'t request ViewModel before onCreate call."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public i()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->l:Lb/n/s;

    if-nez v0, :cond_1b

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/activity/ComponentActivity$e;

    if-eqz v0, :cond_10

    .line 3
    iget-object v0, v0, Landroidx/activity/ComponentActivity$e;->a:Lb/n/s;

    iput-object v0, p0, Landroidx/activity/ComponentActivity;->l:Lb/n/s;

    .line 4
    :cond_10
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->l:Lb/n/s;

    if-nez v0, :cond_1b

    .line 5
    new-instance v0, Lb/n/s;

    invoke-direct {v0}, Lb/n/s;-><init>()V

    iput-object v0, p0, Landroidx/activity/ComponentActivity;->l:Lb/n/s;

    :cond_1b
    return-void
.end method

.method public final j()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p0}, Lb/n/u;->a(Landroid/view/View;Lb/n/h;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p0}, Lb/n/v;->a(Landroid/view/View;Lb/n/t;)V

    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p0}, Lb/q/d;->a(Landroid/view/View;Lb/q/c;)V

    return-void
.end method

.method public k()Ljava/lang/Object;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->o:Lb/a/e/c;

    invoke-virtual {v0, p1, p2, p3}, Lb/a/e/c;->a(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 2
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    :cond_b
    return-void
.end method

.method public onBackPressed()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->m:Landroidx/activity/OnBackPressedDispatcher;

    invoke-virtual {v0}, Landroidx/activity/OnBackPressedDispatcher;->a()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->k:Lb/q/b;

    invoke-virtual {v0, p1}, Lb/q/b;->a(Landroid/os/Bundle;)V

    .line 2
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->i:Lb/a/d/a;

    invoke-virtual {v0, p0}, Lb/a/d/a;->a(Landroid/content/Context;)V

    .line 3
    invoke-super {p0, p1}, Landroidx/core/app/ComponentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 4
    invoke-static {p0}, Landroidx/lifecycle/ReportFragment;->a(Landroid/app/Activity;)V

    .line 5
    iget p1, p0, Landroidx/activity/ComponentActivity;->n:I

    if-eqz p1, :cond_17

    .line 6
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    :cond_17
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->o:Lb/a/e/c;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "androidx.activity.result.contract.extra.PERMISSIONS"

    .line 2
    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS"

    .line 3
    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object v1

    const/4 v2, -0x1

    .line 4
    invoke-virtual {v0, p1, v2, v1}, Lb/a/e/c;->a(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_23

    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_23

    .line 6
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    :cond_23
    return-void
.end method

.method public final onRetainNonConfigurationInstance()Ljava/lang/Object;
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->k()Ljava/lang/Object;

    move-result-object v0

    .line 2
    iget-object v1, p0, Landroidx/activity/ComponentActivity;->l:Lb/n/s;

    if-nez v1, :cond_12

    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/activity/ComponentActivity$e;

    if-eqz v2, :cond_12

    .line 4
    iget-object v1, v2, Landroidx/activity/ComponentActivity$e;->a:Lb/n/s;

    :cond_12
    if-nez v1, :cond_18

    if-nez v0, :cond_18

    const/4 v0, 0x0

    return-object v0

    .line 5
    :cond_18
    new-instance v0, Landroidx/activity/ComponentActivity$e;

    invoke-direct {v0}, Landroidx/activity/ComponentActivity$e;-><init>()V

    .line 6
    iput-object v1, v0, Landroidx/activity/ComponentActivity$e;->a:Lb/n/s;

    return-object v0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->a()Lb/n/e;

    move-result-object v0

    .line 2
    instance-of v1, v0, Lb/n/i;

    if-eqz v1, :cond_f

    .line 3
    check-cast v0, Lb/n/i;

    sget-object v1, Lb/n/e$c;->CREATED:Lb/n/e$c;

    invoke-virtual {v0, v1}, Lb/n/i;->d(Lb/n/e$c;)V

    .line 4
    :cond_f
    invoke-super {p0, p1}, Landroidx/core/app/ComponentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 5
    iget-object v0, p0, Landroidx/activity/ComponentActivity;->k:Lb/q/b;

    invoke-virtual {v0, p1}, Lb/q/b;->b(Landroid/os/Bundle;)V

    return-void
.end method

.method public reportFullyDrawn()V
    .registers 3

    .line 1
    :try_start_0
    invoke-static {}, Lb/r/a;->b()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "reportFullyDrawn() for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lb/r/a;->a(Ljava/lang/String;)V

    .line 3
    :cond_1e
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-le v0, v1, :cond_28

    .line 4
    invoke-super {p0}, Landroid/app/Activity;->reportFullyDrawn()V

    goto :goto_37

    .line 5
    :cond_28
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ne v0, v1, :cond_37

    const-string v0, "android.permission.UPDATE_DEVICE_STATS"

    invoke-static {p0, v0}, Lb/h/e/a;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_37

    .line 6
    invoke-super {p0}, Landroid/app/Activity;->reportFullyDrawn()V
    :try_end_37
    .catchall {:try_start_0 .. :try_end_37} :catchall_3b

    .line 7
    :cond_37
    :goto_37
    invoke-static {}, Lb/r/a;->a()V

    return-void

    :catchall_3b
    move-exception v0

    invoke-static {}, Lb/r/a;->a()V

    .line 8
    throw v0
.end method

.method public setContentView(I)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->j()V

    .line 2
    invoke-super {p0, p1}, Landroid/app/Activity;->setContentView(I)V

    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 2
    .param p1    # Landroid/view/View;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness",
                "MissingNullability"
            }
        .end annotation
    .end param

    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->j()V

    .line 4
    invoke-super {p0, p1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1    # Landroid/view/View;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness",
                "MissingNullability"
            }
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness",
                "MissingNullability"
            }
        .end annotation
    .end param

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->j()V

    .line 6
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .registers 3
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 4
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    .registers 7
    .param p1    # Landroid/content/IntentSender;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/IntentSender$SendIntentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super/range {p0 .. p6}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V

    return-void
.end method

.method public startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    .registers 8
    .param p1    # Landroid/content/IntentSender;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/IntentSender$SendIntentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    invoke-super/range {p0 .. p7}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    return-void
.end method
