.class public abstract Lnet/nyx/base/BaseActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "BaseActivity.java"

# interfaces
.implements Ld/a/a/g/b;
.implements Ld/a/a/g/e;
.implements Ld/a/a/g/g;
.implements Ld/a/a/g/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/nyx/base/BaseActivity$a;
    }
.end annotation


# instance fields
.field public w:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lnet/nyx/base/BaseActivity$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract A()V
.end method

.method public a(Landroid/content/Intent;Landroid/os/Bundle;Lnet/nyx/base/BaseActivity$a;)V
    .registers 9

    .line 2
    iget-object v0, p0, Lnet/nyx/base/BaseActivity;->w:Landroid/util/SparseArray;

    if-nez v0, :cond_c

    .line 3
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lnet/nyx/base/BaseActivity;->w:Landroid/util/SparseArray;

    .line 4
    :cond_c
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    const-wide/high16 v3, 0x4030000000000000L    # 16.0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    .line 5
    iget-object v1, p0, Lnet/nyx/base/BaseActivity;->w:Landroid/util/SparseArray;

    invoke-virtual {v1, v0, p3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 6
    invoke-virtual {p0, p1, v0, p2}, Lnet/nyx/base/BaseActivity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public a(Landroid/content/Intent;Lnet/nyx/base/BaseActivity$a;)V
    .registers 4

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0, p2}, Lnet/nyx/base/BaseActivity;->a(Landroid/content/Intent;Landroid/os/Bundle;Lnet/nyx/base/BaseActivity$a;)V

    return-void
.end method

.method public varargs synthetic a(Landroid/view/View$OnClickListener;[I)V
    .registers 3

    invoke-static {p0, p1, p2}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View$OnClickListener;[I)V

    return-void
.end method

.method public varargs synthetic a(Landroid/view/View$OnClickListener;[Landroid/view/View;)V
    .registers 3

    invoke-static {p0, p1, p2}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View$OnClickListener;[Landroid/view/View;)V

    return-void
.end method

.method public synthetic a(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0, p1}, Ld/a/a/g/a;->a(Ld/a/a/g/b;Ljava/lang/Class;)V

    return-void
.end method

.method public varargs synthetic a([I)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;[I)V

    return-void
.end method

.method public varargs synthetic a([Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;[Landroid/view/View;)V

    return-void
.end method

.method public synthetic a(Ljava/lang/Runnable;)Z
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/f;->a(Ld/a/a/g/g;Ljava/lang/Runnable;)Z

    move-result p1

    return p1
.end method

.method public synthetic a(Ljava/lang/Runnable;J)Z
    .registers 4

    invoke-static {p0, p1, p2, p3}, Ld/a/a/g/f;->b(Ld/a/a/g/g;Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public synthetic b(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/h;->a(Ld/a/a/g/i;Landroid/view/View;)V

    return-void
.end method

.method public synthetic b(Ljava/lang/Runnable;J)Z
    .registers 4

    invoke-static {p0, p1, p2, p3}, Ld/a/a/g/f;->a(Ld/a/a/g/g;Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public synthetic c(Landroid/view/View;)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object p1

    invoke-interface {p0, p1}, Ld/a/a/g/i;->b(Landroid/view/View;)V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 6

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->l()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->A()Ljava/util/List;

    move-result-object v0

    .line 2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 3
    instance-of v2, v1, Ld/a/a/e;

    if-eqz v2, :cond_c

    .line 4
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->a()Lb/n/e;

    move-result-object v2

    invoke-virtual {v2}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object v2

    sget-object v3, Lb/n/e$c;->RESUMED:Lb/n/e$c;

    if-eq v2, v3, :cond_29

    goto :goto_c

    .line 5
    :cond_29
    check-cast v1, Ld/a/a/e;

    invoke-virtual {v1, p1}, Ld/a/a/e;->a(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_c

    const/4 p1, 0x1

    return p1

    .line 6
    :cond_33
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public synthetic f()Landroid/app/Activity;
    .registers 2

    invoke-static {p0}, Ld/a/a/g/a;->a(Ld/a/a/g/b;)Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public finish()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    invoke-interface {p0, v0}, Ld/a/a/g/i;->b(Landroid/view/View;)V

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 1

    return-object p0
.end method

.method public synthetic h()V
    .registers 1

    invoke-static {p0}, Ld/a/a/g/f;->a(Ld/a/a/g/g;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lnet/nyx/base/BaseActivity;->w:Landroid/util/SparseArray;

    if-eqz v0, :cond_15

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnet/nyx/base/BaseActivity$a;

    if-eqz v0, :cond_15

    .line 2
    invoke-interface {v0, p2, p3}, Lnet/nyx/base/BaseActivity$a;->a(ILandroid/content/Intent;)V

    .line 3
    iget-object p2, p0, Lnet/nyx/base/BaseActivity;->w:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->remove(I)V

    return-void

    .line 4
    :cond_15
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public synthetic onClick(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->x()V

    return-void
.end method

.method public onDestroy()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 2
    invoke-interface {p0}, Ld/a/a/g/g;->h()V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    invoke-interface {p0, v0}, Ld/a/a/g/i;->b(Landroid/view/View;)V

    .line 2
    invoke-super {p0, p1, p2, p3}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public v()Landroid/view/ViewGroup;
    .registers 2

    const v0, 0x1020002

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public abstract w()I
.end method

.method public x()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->y()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->A()V

    return-void
.end method

.method public y()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->w()I

    move-result v0

    if-lez v0, :cond_10

    .line 2
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->w()I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 3
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->z()V

    :cond_10
    return-void
.end method

.method public z()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->v()Landroid/view/ViewGroup;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setSoundEffectsEnabled(Z)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->v()Landroid/view/ViewGroup;

    move-result-object v0

    new-instance v1, Ld/a/a/a;

    invoke-direct {v1, p0}, Ld/a/a/a;-><init>(Lnet/nyx/base/BaseActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
