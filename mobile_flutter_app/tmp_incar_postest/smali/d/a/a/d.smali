.class public Ld/a/a/d;
.super Lb/b/k/d;
.source "BaseDialog.java"

# interfaces
.implements Lb/n/h;
.implements Ld/a/a/g/b;
.implements Ld/a/a/g/k;
.implements Ld/a/a/g/g;
.implements Ld/a/a/g/e;
.implements Ld/a/a/g/c;
.implements Ld/a/a/g/i;
.implements Landroid/content/DialogInterface$OnShowListener;
.implements Landroid/content/DialogInterface$OnCancelListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/a/a/d$l;,
        Ld/a/a/d$k;,
        Ld/a/a/d$h;,
        Ld/a/a/d$m;,
        Ld/a/a/d$j;,
        Ld/a/a/d$i;,
        Ld/a/a/d$o;,
        Ld/a/a/d$p;,
        Ld/a/a/d$f;,
        Ld/a/a/d$e;,
        Ld/a/a/d$c;,
        Ld/a/a/d$n;,
        Ld/a/a/d$q;,
        Ld/a/a/d$g;,
        Ld/a/a/d$d;,
        Ld/a/a/d$b;
    }
.end annotation


# instance fields
.field public final j:Ld/a/a/d$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ld/a/a/d$g<",
            "Ld/a/a/d;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Lb/n/i;

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/a/d$m;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/a/d$h;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/a/d$k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3

    .line 1
    invoke-direct {p0, p1, p2}, Lb/b/k/d;-><init>(Landroid/content/Context;I)V

    .line 2
    new-instance p1, Ld/a/a/d$g;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ld/a/a/d$g;-><init>(Landroid/content/DialogInterface$OnShowListener;Ld/a/a/d$a;)V

    iput-object p1, p0, Ld/a/a/d;->j:Ld/a/a/d$g;

    .line 3
    new-instance p1, Lb/n/i;

    invoke-direct {p1, p0}, Lb/n/i;-><init>(Lb/n/h;)V

    iput-object p1, p0, Ld/a/a/d;->k:Lb/n/i;

    return-void
.end method

.method public static synthetic a(Ld/a/a/d;Ljava/util/List;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Ld/a/a/d;->c(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b(Ld/a/a/d;Ljava/util/List;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Ld/a/a/d;->a(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c(Ld/a/a/d;Ljava/util/List;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Ld/a/a/d;->b(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public a()Lb/n/e;
    .registers 2

    .line 5
    iget-object v0, p0, Ld/a/a/d;->k:Lb/n/i;

    return-object v0
.end method

.method public synthetic a(I)Ljava/lang/String;
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/j;->a(Ld/a/a/g/k;I)Ljava/lang/String;

    move-result-object p1

    return-object p1
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

.method public a(Ld/a/a/d$h;)V
    .registers 3

    .line 11
    iget-object v0, p0, Ld/a/a/d;->m:Ljava/util/List;

    if-nez v0, :cond_10

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/a/d;->m:Ljava/util/List;

    .line 13
    iget-object v0, p0, Ld/a/a/d;->j:Ld/a/a/d$g;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 14
    :cond_10
    iget-object v0, p0, Ld/a/a/d;->m:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Ld/a/a/d$k;)V
    .registers 3

    .line 15
    iget-object v0, p0, Ld/a/a/d;->n:Ljava/util/List;

    if-nez v0, :cond_10

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/a/d;->n:Ljava/util/List;

    .line 17
    iget-object v0, p0, Ld/a/a/d;->j:Ld/a/a/d$g;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 18
    :cond_10
    iget-object v0, p0, Ld/a/a/d;->n:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Ld/a/a/d$l;)V
    .registers 4

    .line 6
    new-instance v0, Ld/a/a/d$f;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ld/a/a/d$f;-><init>(Ld/a/a/d$l;Ld/a/a/d$a;)V

    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    return-void
.end method

.method public a(Ld/a/a/d$m;)V
    .registers 3

    .line 7
    iget-object v0, p0, Ld/a/a/d;->l:Ljava/util/List;

    if-nez v0, :cond_10

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/a/d;->l:Ljava/util/List;

    .line 9
    iget-object v0, p0, Ld/a/a/d;->j:Ld/a/a/d$g;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 10
    :cond_10
    iget-object v0, p0, Ld/a/a/d;->l:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

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

.method public final a(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ld/a/a/d$h;",
            ">;)V"
        }
    .end annotation

    .line 19
    iget-object v0, p0, Ld/a/a/d;->j:Ld/a/a/d$g;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 20
    iput-object p1, p0, Ld/a/a/d;->m:Ljava/util/List;

    return-void
.end method

.method public a(Z)V
    .registers 4

    .line 2
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const/4 v1, 0x2

    if-eqz p1, :cond_e

    .line 3
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_11

    .line 4
    :cond_e
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    :goto_11
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

.method public synthetic b(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TS;>;)TS;"
        }
    .end annotation

    invoke-static {p0, p1}, Ld/a/a/g/j;->a(Ld/a/a/g/k;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public synthetic b(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/h;->a(Ld/a/a/g/i;Landroid/view/View;)V

    return-void
.end method

.method public b(Ld/a/a/d$k;)V
    .registers 3

    .line 4
    iget-object v0, p0, Ld/a/a/d;->n:Ljava/util/List;

    if-nez v0, :cond_5

    return-void

    .line 5
    :cond_5
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public b(Ld/a/a/d$m;)V
    .registers 3

    .line 2
    iget-object v0, p0, Ld/a/a/d;->l:Ljava/util/List;

    if-nez v0, :cond_5

    return-void

    .line 3
    :cond_5
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ld/a/a/d$k;",
            ">;)V"
        }
    .end annotation

    .line 6
    iget-object v0, p0, Ld/a/a/d;->j:Ld/a/a/d$g;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 7
    iput-object p1, p0, Ld/a/a/d;->n:Ljava/util/List;

    return-void
.end method

.method public synthetic b(Ljava/lang/Runnable;J)Z
    .registers 4

    invoke-static {p0, p1, p2, p3}, Ld/a/a/g/f;->a(Ld/a/a/g/g;Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public c(I)V
    .registers 3

    .line 2
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 3
    :cond_7
    invoke-virtual {v0, p1}, Landroid/view/Window;->setGravity(I)V

    return-void
.end method

.method public final c(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ld/a/a/d$m;",
            ">;)V"
        }
    .end annotation

    .line 4
    iget-object v0, p0, Ld/a/a/d;->j:Ld/a/a/d$g;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 5
    iput-object p1, p0, Ld/a/a/d;->l:Ljava/util/List;

    return-void
.end method

.method public synthetic d()Landroid/content/res/Resources;
    .registers 2

    invoke-static {p0}, Ld/a/a/g/j;->a(Ld/a/a/g/k;)Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public d(I)V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 3
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public dismiss()V
    .registers 4

    .line 1
    invoke-interface {p0}, Ld/a/a/g/g;->h()V

    .line 2
    invoke-virtual {p0}, Landroid/app/Dialog;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 3
    const-class v1, Landroid/view/inputmethod/InputMethodManager;

    invoke-interface {p0, v1}, Ld/a/a/g/k;->b(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 4
    :cond_19
    invoke-super {p0}, Lb/b/k/d;->dismiss()V

    return-void
.end method

.method public e(I)V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 3
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public synthetic f()Landroid/app/Activity;
    .registers 2

    invoke-static {p0}, Ld/a/a/g/a;->a(Ld/a/a/g/b;)Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public f(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {v0, p1}, Landroid/view/Window;->setWindowAnimations(I)V

    return-void
.end method

.method public g()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, -0x1

    return v0

    .line 2
    :cond_8
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    return v0
.end method

.method public synthetic h()V
    .registers 1

    invoke-static {p0}, Ld/a/a/g/f;->a(Ld/a/a/g/g;)V

    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3

    .line 1
    iget-object p1, p0, Ld/a/a/d;->m:Ljava/util/List;

    if-nez p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x0

    .line 2
    :goto_6
    iget-object v0, p0, Ld/a/a/d;->m:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_1c

    .line 3
    iget-object v0, p0, Ld/a/a/d;->m:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld/a/a/d$h;

    invoke-interface {v0, p0}, Ld/a/a/d$h;->a(Ld/a/a/d;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_6

    :cond_1c
    return-void
.end method

.method public synthetic onClick(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Lb/b/k/d;->onCreate(Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Ld/a/a/d;->k:Lb/n/i;

    sget-object v0, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    invoke-virtual {p1, v0}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3

    .line 1
    iget-object p1, p0, Ld/a/a/d;->k:Lb/n/i;

    sget-object v0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    invoke-virtual {p1, v0}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 2
    iget-object p1, p0, Ld/a/a/d;->n:Ljava/util/List;

    if-nez p1, :cond_c

    return-void

    :cond_c
    const/4 p1, 0x0

    .line 3
    :goto_d
    iget-object v0, p0, Ld/a/a/d;->n:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_23

    .line 4
    iget-object v0, p0, Ld/a/a/d;->n:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld/a/a/d$k;

    invoke-interface {v0, p0}, Ld/a/a/d$k;->b(Ld/a/a/d;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_d

    :cond_23
    return-void
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .registers 3

    .line 1
    iget-object p1, p0, Ld/a/a/d;->k:Lb/n/i;

    sget-object v0, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    invoke-virtual {p1, v0}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 2
    iget-object p1, p0, Ld/a/a/d;->l:Ljava/util/List;

    if-nez p1, :cond_c

    return-void

    :cond_c
    const/4 p1, 0x0

    .line 3
    :goto_d
    iget-object v0, p0, Ld/a/a/d;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_23

    .line 4
    iget-object v0, p0, Ld/a/a/d;->l:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld/a/a/d$m;

    invoke-interface {v0, p0}, Ld/a/a/d$m;->a(Ld/a/a/d;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_d

    :cond_23
    return-void
.end method

.method public onStart()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    iget-object v0, p0, Ld/a/a/d;->k:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void
.end method

.method public onStop()V
    .registers 3

    .line 1
    invoke-super {p0}, Lb/b/k/d;->onStop()V

    .line 2
    iget-object v0, p0, Ld/a/a/d;->k:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void
.end method

.method public setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-nez p1, :cond_3

    return-void

    .line 1
    :cond_3
    new-instance v0, Ld/a/a/d$c;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ld/a/a/d$c;-><init>(Landroid/content/DialogInterface$OnCancelListener;Ld/a/a/d$a;)V

    invoke-virtual {p0, v0}, Ld/a/a/d;->a(Ld/a/a/d$h;)V

    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-nez p1, :cond_3

    return-void

    .line 1
    :cond_3
    new-instance v0, Ld/a/a/d$e;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ld/a/a/d$e;-><init>(Landroid/content/DialogInterface$OnDismissListener;Ld/a/a/d$a;)V

    invoke-virtual {p0, v0}, Ld/a/a/d;->a(Ld/a/a/d$k;)V

    return-void
.end method

.method public setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    return-void
.end method

.method public setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-nez p1, :cond_3

    return-void

    .line 1
    :cond_3
    new-instance v0, Ld/a/a/d$n;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ld/a/a/d$n;-><init>(Landroid/content/DialogInterface$OnShowListener;Ld/a/a/d$a;)V

    invoke-virtual {p0, v0}, Ld/a/a/d;->a(Ld/a/a/d$m;)V

    return-void
.end method

.method public synthetic startActivity(Landroid/content/Intent;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/a;->a(Ld/a/a/g/b;Landroid/content/Intent;)V

    return-void
.end method
