.class public Landroidx/fragment/app/FragmentActivity;
.super Landroidx/activity/ComponentActivity;
.source "FragmentActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/FragmentActivity$c;
    }
.end annotation


# instance fields
.field public final p:Lb/l/d/f;

.field public final q:Lb/n/i;

.field public r:Z

.field public s:Z

.field public t:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/activity/ComponentActivity;-><init>()V

    .line 2
    new-instance v0, Landroidx/fragment/app/FragmentActivity$c;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentActivity$c;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    invoke-static {v0}, Lb/l/d/f;->a(Lb/l/d/h;)Lb/l/d/f;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    .line 3
    new-instance v0, Lb/n/i;

    invoke-direct {v0, p0}, Lb/n/i;-><init>(Lb/n/h;)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->t:Z

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->m()V

    return-void
.end method

.method public static a(Landroidx/fragment/app/FragmentManager;Lb/n/e$c;)Z
    .registers 7

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->A()Ljava/util/List;

    move-result-object p0

    .line 4
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_9
    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_57

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-nez v1, :cond_18

    goto :goto_9

    .line 5
    :cond_18
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->w()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_27

    .line 6
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->o()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    .line 7
    invoke-static {v2, p1}, Landroidx/fragment/app/FragmentActivity;->a(Landroidx/fragment/app/FragmentManager;Lb/n/e$c;)Z

    move-result v2

    or-int/2addr v0, v2

    .line 8
    :cond_27
    iget-object v2, v1, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    const/4 v3, 0x1

    if-eqz v2, :cond_42

    .line 9
    invoke-virtual {v2}, Lb/l/d/u;->a()Lb/n/e;

    move-result-object v2

    invoke-virtual {v2}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object v2

    sget-object v4, Lb/n/e$c;->STARTED:Lb/n/e$c;

    invoke-virtual {v2, v4}, Lb/n/e$c;->isAtLeast(Lb/n/e$c;)Z

    move-result v2

    if-eqz v2, :cond_42

    .line 10
    iget-object v0, v1, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-virtual {v0, p1}, Lb/l/d/u;->a(Lb/n/e$c;)V

    const/4 v0, 0x1

    .line 11
    :cond_42
    iget-object v2, v1, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    invoke-virtual {v2}, Lb/n/i;->a()Lb/n/e$c;

    move-result-object v2

    sget-object v4, Lb/n/e$c;->STARTED:Lb/n/e$c;

    invoke-virtual {v2, v4}, Lb/n/e$c;->isAtLeast(Lb/n/e$c;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 12
    iget-object v0, v1, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    invoke-virtual {v0, p1}, Lb/n/i;->d(Lb/n/e$c;)V

    const/4 v0, 0x1

    goto :goto_9

    :cond_57
    return v0
.end method


# virtual methods
.method public final a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/l/d/f;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroidx/fragment/app/Fragment;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public a(Landroid/view/View;Landroid/view/Menu;)Z
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 2
    invoke-super {p0, v0, p1, p2}, Landroid/app/Activity;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 7

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 2
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Local FragmentActivity "

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 3
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " State:"

    .line 4
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 6
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "mCreated="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 7
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentActivity;->r:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, " mResumed="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 8
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentActivity;->s:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, " mStopped="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 9
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentActivity;->t:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    if-eqz v1, :cond_5a

    .line 11
    invoke-static {p0}, Lb/o/a/a;->a(Lb/n/h;)Lb/o/a/a;

    move-result-object v1

    invoke-virtual {v1, v0, p2, p3, p4}, Lb/o/a/a;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 12
    :cond_5a
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->j()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/fragment/app/FragmentManager;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public l()Landroidx/fragment/app/FragmentManager;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->j()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    return-object v0
.end method

.method public final m()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->c()Landroidx/savedstate/SavedStateRegistry;

    move-result-object v0

    new-instance v1, Landroidx/fragment/app/FragmentActivity$a;

    invoke-direct {v1, p0}, Landroidx/fragment/app/FragmentActivity$a;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    const-string v2, "android:support:fragments"

    invoke-virtual {v0, v2, v1}, Landroidx/savedstate/SavedStateRegistry;->a(Ljava/lang/String;Landroidx/savedstate/SavedStateRegistry$b;)V

    .line 2
    new-instance v0, Landroidx/fragment/app/FragmentActivity$b;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentActivity$b;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    invoke-virtual {p0, v0}, Landroidx/activity/ComponentActivity;->a(Lb/a/d/b;)V

    return-void
.end method

.method public n()V
    .registers 3

    .line 1
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->l()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    sget-object v1, Lb/n/e$c;->CREATED:Lb/n/e$c;

    invoke-static {v0, v1}, Landroidx/fragment/app/FragmentActivity;->a(Landroidx/fragment/app/FragmentManager;Lb/n/e$c;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void
.end method

.method public o()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->f()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->k()V

    .line 2
    invoke-super {p0, p1, p2, p3}, Landroidx/activity/ComponentActivity;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->k()V

    .line 2
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0, p1}, Lb/l/d/f;->a(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/ComponentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    sget-object v0, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    invoke-virtual {p1, v0}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 3
    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {p1}, Lb/l/d/f;->b()V

    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 5

    if-nez p1, :cond_12

    .line 1
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {p0}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lb/l/d/f;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result p2

    or-int/2addr p1, p2

    return p1

    .line 3
    :cond_12
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 6

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/fragment/app/FragmentActivity;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_b

    .line 2
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_b
    return-object v0
.end method

.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 5

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, v0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_c

    .line 4
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_c
    return-object v0
.end method

.method public onDestroy()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->c()V

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onLowMemory()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onLowMemory()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->d()V

    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p1, 0x1

    return p1

    :cond_8
    if-eqz p1, :cond_16

    const/4 v0, 0x6

    if-eq p1, v0, :cond_f

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_f
    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {p1, p2}, Lb/l/d/f;->a(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 3
    :cond_16
    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {p1, p2}, Lb/l/d/f;->b(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMultiWindowModeChanged(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0, p1}, Lb/l/d/f;->a(Z)V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 3
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->k()V

    .line 2
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .registers 4

    if-nez p1, :cond_7

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0, p2}, Lb/l/d/f;->a(Landroid/view/Menu;)V

    .line 2
    :cond_7
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPanelClosed(ILandroid/view/Menu;)V

    return-void
.end method

.method public onPause()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->s:Z

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->e()V

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onPictureInPictureModeChanged(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0, p1}, Lb/l/d/f;->b(Z)V

    return-void
.end method

.method public onPostResume()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPostResume()V

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->o()V

    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 4

    if-nez p1, :cond_e

    .line 1
    invoke-virtual {p0, p2, p3}, Landroidx/fragment/app/FragmentActivity;->a(Landroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    .line 2
    iget-object p2, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {p2, p3}, Lb/l/d/f;->b(Landroid/view/Menu;)Z

    move-result p2

    or-int/2addr p1, p2

    return p1

    .line 3
    :cond_e
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->k()V

    .line 2
    invoke-super {p0, p1, p2, p3}, Landroidx/activity/ComponentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method public onResume()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->k()V

    .line 2
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->s:Z

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->i()Z

    return-void
.end method

.method public onStart()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->k()V

    .line 2
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->t:Z

    .line 4
    iget-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->r:Z

    if-nez v0, :cond_17

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->r:Z

    .line 6
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->a()V

    .line 7
    :cond_17
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->i()Z

    .line 8
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 9
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->g()V

    return-void
.end method

.method public onStateNotSaved()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->k()V

    return-void
.end method

.method public onStop()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->t:Z

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->n()V

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->p:Lb/l/d/f;

    invoke-virtual {v0}, Lb/l/d/f;->h()V

    .line 5
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void
.end method

.method public p()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    return-void
.end method
