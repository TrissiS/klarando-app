.class public Lb/l/d/c;
.super Landroidx/fragment/app/Fragment;
.source "DialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public f0:Landroid/os/Handler;

.field public g0:Ljava/lang/Runnable;

.field public h0:Landroid/content/DialogInterface$OnCancelListener;

.field public i0:Landroid/content/DialogInterface$OnDismissListener;

.field public j0:I

.field public k0:I

.field public l0:Z

.field public m0:Z

.field public n0:I

.field public o0:Z

.field public p0:Lb/n/n;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/n/n<",
            "Lb/n/h;",
            ">;"
        }
    .end annotation
.end field

.field public q0:Landroid/app/Dialog;

.field public r0:Z

.field public s0:Z

.field public t0:Z

.field public u0:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    new-instance v0, Lb/l/d/c$a;

    invoke-direct {v0, p0}, Lb/l/d/c$a;-><init>(Lb/l/d/c;)V

    iput-object v0, p0, Lb/l/d/c;->g0:Ljava/lang/Runnable;

    .line 3
    new-instance v0, Lb/l/d/c$b;

    invoke-direct {v0, p0}, Lb/l/d/c$b;-><init>(Lb/l/d/c;)V

    iput-object v0, p0, Lb/l/d/c;->h0:Landroid/content/DialogInterface$OnCancelListener;

    .line 4
    new-instance v0, Lb/l/d/c$c;

    invoke-direct {v0, p0}, Lb/l/d/c$c;-><init>(Lb/l/d/c;)V

    iput-object v0, p0, Lb/l/d/c;->i0:Landroid/content/DialogInterface$OnDismissListener;

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lb/l/d/c;->j0:I

    .line 6
    iput v0, p0, Lb/l/d/c;->k0:I

    const/4 v1, 0x1

    .line 7
    iput-boolean v1, p0, Lb/l/d/c;->l0:Z

    .line 8
    iput-boolean v1, p0, Lb/l/d/c;->m0:Z

    const/4 v1, -0x1

    .line 9
    iput v1, p0, Lb/l/d/c;->n0:I

    .line 10
    new-instance v1, Lb/l/d/c$d;

    invoke-direct {v1, p0}, Lb/l/d/c$d;-><init>(Lb/l/d/c;)V

    iput-object v1, p0, Lb/l/d/c;->p0:Lb/n/n;

    .line 11
    iput-boolean v0, p0, Lb/l/d/c;->u0:Z

    return-void
.end method

.method public static synthetic a(Lb/l/d/c;)Landroid/app/Dialog;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    return-object p0
.end method

.method public static synthetic b(Lb/l/d/c;)Landroid/content/DialogInterface$OnDismissListener;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/l/d/c;->i0:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static synthetic c(Lb/l/d/c;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lb/l/d/c;->m0:Z

    return p0
.end method


# virtual methods
.method public A0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/l/d/c;->u0:Z

    return v0
.end method

.method public final B0()Landroid/app/Dialog;
    .registers 4

    .line 1
    invoke-virtual {p0}, Lb/l/d/c;->y0()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    .line 2
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DialogFragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " does not have a Dialog."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Landroid/app/Dialog;I)V
    .registers 5

    const/4 v0, 0x1

    if-eq p2, v0, :cond_15

    const/4 v1, 0x2

    if-eq p2, v1, :cond_15

    const/4 v1, 0x3

    if-eq p2, v1, :cond_a

    goto :goto_18

    .line 23
    :cond_a
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    if-eqz p2, :cond_15

    const/16 v1, 0x18

    .line 24
    invoke-virtual {p2, v1}, Landroid/view/Window;->addFlags(I)V

    .line 25
    :cond_15
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    :goto_18
    return-void
.end method

.method public a(Landroid/content/Context;)V
    .registers 3

    .line 19
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/content/Context;)V

    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->N()Landroidx/lifecycle/LiveData;

    move-result-object p1

    iget-object v0, p0, Lb/l/d/c;->p0:Lb/n/n;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/LiveData;->a(Lb/n/n;)V

    .line 21
    iget-boolean p1, p0, Lb/l/d/c;->t0:Z

    if-nez p1, :cond_13

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lb/l/d/c;->s0:Z

    :cond_13
    return-void
.end method

.method public final a(ZZ)V
    .registers 6

    .line 2
    iget-boolean v0, p0, Lb/l/d/c;->s0:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lb/l/d/c;->s0:Z

    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lb/l/d/c;->t0:Z

    .line 5
    iget-object v1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz v1, :cond_33

    const/4 v2, 0x0

    .line 6
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 7
    iget-object v1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    if-nez p2, :cond_33

    .line 8
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p2

    iget-object v1, p0, Lb/l/d/c;->f0:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne p2, v1, :cond_2c

    .line 9
    iget-object p2, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    invoke-virtual {p0, p2}, Lb/l/d/c;->onDismiss(Landroid/content/DialogInterface;)V

    goto :goto_33

    .line 10
    :cond_2c
    iget-object p2, p0, Lb/l/d/c;->f0:Landroid/os/Handler;

    iget-object v1, p0, Lb/l/d/c;->g0:Ljava/lang/Runnable;

    invoke-virtual {p2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    :cond_33
    :goto_33
    iput-boolean v0, p0, Lb/l/d/c;->r0:Z

    .line 12
    iget p2, p0, Lb/l/d/c;->n0:I

    if-ltz p2, :cond_46

    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->A()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    iget p2, p0, Lb/l/d/c;->n0:I

    invoke-virtual {p1, p2, v0}, Landroidx/fragment/app/FragmentManager;->a(II)V

    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lb/l/d/c;->n0:I

    goto :goto_5a

    .line 15
    :cond_46
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->A()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->b()Lb/l/d/q;

    move-result-object p2

    .line 16
    invoke-virtual {p2, p0}, Lb/l/d/q;->c(Landroidx/fragment/app/Fragment;)Lb/l/d/q;

    if-eqz p1, :cond_57

    .line 17
    invoke-virtual {p2}, Lb/l/d/q;->b()I

    goto :goto_5a

    .line 18
    :cond_57
    invoke-virtual {p2}, Lb/l/d/q;->a()I

    :goto_5a
    return-void
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V
    .registers 4

    .line 2
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 3
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-nez p1, :cond_1a

    .line 4
    iget-object p1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz p1, :cond_1a

    if-eqz p3, :cond_1a

    const-string p1, "android:savedDialogState"

    .line 5
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_1a

    .line 6
    iget-object p2, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    invoke-virtual {p2, p1}, Landroid/app/Dialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    :cond_1a
    return-void
.end method

.method public b0()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->b0()V

    .line 2
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz v0, :cond_21

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, p0, Lb/l/d/c;->r0:Z

    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 5
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    iget-boolean v0, p0, Lb/l/d/c;->s0:Z

    if-nez v0, :cond_1c

    .line 7
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    invoke-virtual {p0, v0}, Lb/l/d/c;->onDismiss(Landroid/content/DialogInterface;)V

    .line 8
    :cond_1c
    iput-object v1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lb/l/d/c;->u0:Z

    :cond_21
    return-void
.end method

.method public c(I)Landroid/view/View;
    .registers 3

    .line 10
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz v0, :cond_9

    .line 11
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_9
    const/4 p1, 0x0

    return-object p1
.end method

.method public c(Landroid/os/Bundle;)V
    .registers 5

    .line 2
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->c(Landroid/os/Bundle;)V

    .line 3
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lb/l/d/c;->f0:Landroid/os/Handler;

    .line 4
    iget v0, p0, Landroidx/fragment/app/Fragment;->E:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    iput-boolean v0, p0, Lb/l/d/c;->m0:Z

    if-eqz p1, :cond_42

    const-string v0, "android:style"

    .line 5
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lb/l/d/c;->j0:I

    const-string v0, "android:theme"

    .line 6
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lb/l/d/c;->k0:I

    const-string v0, "android:cancelable"

    .line 7
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lb/l/d/c;->l0:Z

    .line 8
    iget-boolean v0, p0, Lb/l/d/c;->m0:Z

    const-string v1, "android:showsDialog"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lb/l/d/c;->m0:Z

    const/4 v0, -0x1

    const-string v1, "android:backStackId"

    .line 9
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lb/l/d/c;->n0:I

    :cond_42
    return-void
.end method

.method public c0()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->c0()V

    .line 2
    iget-boolean v0, p0, Lb/l/d/c;->t0:Z

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lb/l/d/c;->s0:Z

    if-nez v0, :cond_e

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lb/l/d/c;->s0:Z

    .line 4
    :cond_e
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->N()Landroidx/lifecycle/LiveData;

    move-result-object v0

    iget-object v1, p0, Lb/l/d/c;->p0:Lb/n/n;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/LiveData;->b(Lb/n/n;)V

    return-void
.end method

.method public d(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .registers 6

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->d(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 2
    iget-boolean v1, p0, Lb/l/d/c;->m0:Z

    const/4 v2, 0x2

    const-string v3, "FragmentManager"

    if-eqz v1, :cond_3f

    iget-boolean v1, p0, Lb/l/d/c;->o0:Z

    if-eqz v1, :cond_10

    goto :goto_3f

    .line 3
    :cond_10
    invoke-virtual {p0, p1}, Lb/l/d/c;->o(Landroid/os/Bundle;)V

    .line 4
    invoke-static {v2}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_32

    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "get layout inflater for DialogFragment "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " from dialog context"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    :cond_32
    iget-object p1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz p1, :cond_3e

    .line 7
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    :cond_3e
    return-object v0

    .line 8
    :cond_3f
    :goto_3f
    invoke-static {v2}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_83

    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getting layout inflater for DialogFragment "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 10
    iget-boolean v1, p0, Lb/l/d/c;->m0:Z

    if-nez v1, :cond_6f

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mShowsDialog = false: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_83

    .line 12
    :cond_6f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCreatingDialog = true: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_83
    :goto_83
    return-object v0
.end method

.method public e()Lb/l/d/e;
    .registers 3

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->e()Lb/l/d/e;

    move-result-object v0

    .line 2
    new-instance v1, Lb/l/d/c$e;

    invoke-direct {v1, p0, v0}, Lb/l/d/c$e;-><init>(Lb/l/d/c;Lb/l/d/e;)V

    return-object v1
.end method

.method public e(Landroid/os/Bundle;)V
    .registers 5

    .line 3
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->e(Landroid/os/Bundle;)V

    .line 4
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz v0, :cond_16

    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "android:dialogShowing"

    .line 6
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "android:savedDialogState"

    .line 7
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 8
    :cond_16
    iget v0, p0, Lb/l/d/c;->j0:I

    if-eqz v0, :cond_1f

    const-string v1, "android:style"

    .line 9
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 10
    :cond_1f
    iget v0, p0, Lb/l/d/c;->k0:I

    if-eqz v0, :cond_28

    const-string v1, "android:theme"

    .line 11
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 12
    :cond_28
    iget-boolean v0, p0, Lb/l/d/c;->l0:Z

    if-nez v0, :cond_31

    const-string v1, "android:cancelable"

    .line 13
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 14
    :cond_31
    iget-boolean v0, p0, Lb/l/d/c;->m0:Z

    if-nez v0, :cond_3a

    const-string v1, "android:showsDialog"

    .line 15
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 16
    :cond_3a
    iget v0, p0, Lb/l/d/c;->n0:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_44

    const-string v1, "android:backStackId"

    .line 17
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_44
    return-void
.end method

.method public f(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->f(Landroid/os/Bundle;)V

    .line 2
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz v0, :cond_16

    if-eqz p1, :cond_16

    const-string v0, "android:savedDialogState"

    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_16

    .line 4
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->onRestoreInstanceState(Landroid/os/Bundle;)V

    :cond_16
    return-void
.end method

.method public f0()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->f0()V

    .line 2
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz v0, :cond_20

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Lb/l/d/c;->r0:Z

    .line 4
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 5
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 6
    invoke-static {v0, p0}, Lb/n/u;->a(Landroid/view/View;Lb/n/h;)V

    .line 7
    invoke-static {v0, p0}, Lb/n/v;->a(Landroid/view/View;Lb/n/t;)V

    .line 8
    invoke-static {v0, p0}, Lb/q/d;->a(Landroid/view/View;Lb/q/c;)V

    :cond_20
    return-void
.end method

.method public g0()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->g0()V

    .line 2
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    :cond_a
    return-void
.end method

.method public n(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4

    const/4 p1, 0x3

    .line 1
    invoke-static {p1}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_1d

    .line 2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCreateDialog called for DialogFragment "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "FragmentManager"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1d
    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t0()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lb/l/d/c;->z0()I

    move-result v1

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-object p1
.end method

.method public final o(Landroid/os/Bundle;)V
    .registers 5

    .line 1
    iget-boolean v0, p0, Lb/l/d/c;->m0:Z

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    iget-boolean v0, p0, Lb/l/d/c;->u0:Z

    if-nez v0, :cond_4d

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 3
    :try_start_b
    iput-boolean v1, p0, Lb/l/d/c;->o0:Z

    .line 4
    invoke-virtual {p0, p1}, Lb/l/d/c;->n(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object p1

    iput-object p1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    .line 5
    iget-boolean v2, p0, Lb/l/d/c;->m0:Z

    if-eqz v2, :cond_43

    .line 6
    iget v2, p0, Lb/l/d/c;->j0:I

    invoke-virtual {p0, p1, v2}, Lb/l/d/c;->a(Landroid/app/Dialog;I)V

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 8
    instance-of v2, p1, Landroid/app/Activity;

    if-eqz v2, :cond_2b

    .line 9
    iget-object v2, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {v2, p1}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 10
    :cond_2b
    iget-object p1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    iget-boolean v2, p0, Lb/l/d/c;->l0:Z

    invoke-virtual {p1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 11
    iget-object p1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    iget-object v2, p0, Lb/l/d/c;->h0:Landroid/content/DialogInterface$OnCancelListener;

    invoke-virtual {p1, v2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 12
    iget-object p1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    iget-object v2, p0, Lb/l/d/c;->i0:Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {p1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 13
    iput-boolean v1, p0, Lb/l/d/c;->u0:Z

    goto :goto_46

    :cond_43
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;
    :try_end_46
    .catchall {:try_start_b .. :try_end_46} :catchall_49

    .line 15
    :goto_46
    iput-boolean v0, p0, Lb/l/d/c;->o0:Z

    goto :goto_4d

    :catchall_49
    move-exception p1

    iput-boolean v0, p0, Lb/l/d/c;->o0:Z

    .line 16
    throw p1

    :cond_4d
    :goto_4d
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 2

    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3

    .line 1
    iget-boolean p1, p0, Lb/l/d/c;->r0:Z

    if-nez p1, :cond_25

    const/4 p1, 0x3

    .line 2
    invoke-static {p1}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_21

    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onDismiss called for DialogFragment "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "FragmentManager"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_21
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1, p1}, Lb/l/d/c;->a(ZZ)V

    :cond_25
    return-void
.end method

.method public x0()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0, v0}, Lb/l/d/c;->a(ZZ)V

    return-void
.end method

.method public y0()Landroid/app/Dialog;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/c;->q0:Landroid/app/Dialog;

    return-object v0
.end method

.method public z0()I
    .registers 2

    .line 1
    iget v0, p0, Lb/l/d/c;->k0:I

    return v0
.end method
