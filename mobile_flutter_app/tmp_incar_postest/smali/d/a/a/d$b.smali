.class public Ld/a/a/d$b;
.super Ljava/lang/Object;
.source "BaseDialog.java"

# interfaces
.implements Ld/a/a/g/b;
.implements Ld/a/a/g/k;
.implements Ld/a/a/g/e;
.implements Ld/a/a/g/i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<B:",
        "Ld/a/a/d$b<",
        "*>;>",
        "Ljava/lang/Object;",
        "Ld/a/a/g/b;",
        "Ld/a/a/g/k;",
        "Ld/a/a/g/e;",
        "Ld/a/a/g/i;"
    }
.end annotation


# instance fields
.field public A:Ld/a/a/d$l;

.field public B:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ld/a/a/d$i<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final h:Landroid/app/Activity;

.field public final i:Landroid/content/Context;

.field public j:Ld/a/a/d;

.field public k:Landroid/view/View;

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:F

.field public w:Ld/a/a/d$j;

.field public final x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/a/d$m;",
            ">;"
        }
    .end annotation
.end field

.field public final y:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/a/d$h;",
            ">;"
        }
    .end annotation
.end field

.field public final z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/a/d$k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget v0, Ld/a/a/f;->BaseDialogTheme:I

    iput v0, p0, Ld/a/a/d$b;->l:I

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Ld/a/a/d$b;->m:I

    const/4 v0, -0x2

    .line 4
    iput v0, p0, Ld/a/a/d$b;->n:I

    .line 5
    iput v0, p0, Ld/a/a/d$b;->o:I

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ld/a/a/d$b;->p:I

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ld/a/a/d$b;->s:Z

    .line 8
    iput-boolean v0, p0, Ld/a/a/d$b;->t:Z

    .line 9
    iput-boolean v0, p0, Ld/a/a/d$b;->u:Z

    const/high16 v0, 0x3f000000    # 0.5f

    .line 10
    iput v0, p0, Ld/a/a/d$b;->v:F

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/a/d$b;->x:Ljava/util/List;

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/a/d$b;->y:Ljava/util/List;

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/a/d$b;->z:Ljava/util/List;

    .line 14
    iput-object p1, p0, Ld/a/a/d$b;->i:Landroid/content/Context;

    .line 15
    invoke-interface {p0}, Ld/a/a/g/b;->f()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Ld/a/a/d$b;->h:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Ld/a/a/d$b;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")TB;"
        }
    .end annotation

    if-eqz p1, :cond_55

    .line 1
    iput-object p1, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    .line 2
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 3
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Lb/b/k/d;->setContentView(Landroid/view/View;)V

    return-object p0

    .line 4
    :cond_10
    iget-object p1, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    if-eqz p1, :cond_2b

    .line 5
    iget v0, p0, Ld/a/a/d$b;->n:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_2b

    iget v0, p0, Ld/a/a/d$b;->o:I

    if-ne v0, v1, :cond_2b

    .line 6
    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p0, v0}, Ld/a/a/d$b;->f(I)Ld/a/a/d$b;

    .line 7
    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Ld/a/a/d$b;->e(I)Ld/a/a/d$b;

    .line 8
    :cond_2b
    iget v0, p0, Ld/a/a/d$b;->p:I

    if-nez v0, :cond_54

    .line 9
    instance-of v0, p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    if-eqz v0, :cond_3e

    .line 10
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iget p1, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq p1, v1, :cond_4b

    .line 11
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->d(I)Ld/a/a/d$b;

    goto :goto_4b

    .line 12
    :cond_3e
    instance-of v0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_4b

    .line 13
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    iget p1, p1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    if-eq p1, v1, :cond_4b

    .line 14
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->d(I)Ld/a/a/d$b;

    .line 15
    :cond_4b
    :goto_4b
    iget p1, p0, Ld/a/a/d$b;->p:I

    if-nez p1, :cond_54

    const/16 p1, 0x11

    .line 16
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->d(I)Ld/a/a/d$b;

    :cond_54
    return-object p0

    .line 17
    :cond_55
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "are you ok?"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ld/a/a/d$h;)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ld/a/a/d$h;",
            ")TB;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Ld/a/a/d$b;->y:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public a(Ld/a/a/d$m;)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ld/a/a/d$m;",
            ")TB;"
        }
    .end annotation

    .line 21
    iget-object v0, p0, Ld/a/a/d$b;->x:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public a(Z)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TB;"
        }
    .end annotation

    .line 18
    iput-boolean p1, p0, Ld/a/a/d$b;->u:Z

    .line 19
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 20
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Ld/a/a/d;->a(Z)V

    :cond_d
    return-object p0
.end method

.method public a()Ld/a/a/d;
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 23
    iget-object v0, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    if-eqz v0, :cond_f9

    .line 24
    invoke-virtual {p0}, Ld/a/a/d$b;->g()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 25
    invoke-virtual {p0}, Ld/a/a/d$b;->b()V

    .line 26
    :cond_d
    iget v0, p0, Ld/a/a/d$b;->p:I

    if-nez v0, :cond_15

    const/16 v0, 0x11

    .line 27
    iput v0, p0, Ld/a/a/d$b;->p:I

    .line 28
    :cond_15
    iget v0, p0, Ld/a/a/d$b;->m:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_40

    .line 29
    iget v0, p0, Ld/a/a/d$b;->p:I

    const/4 v2, 0x3

    if-eq v0, v2, :cond_3c

    const/4 v2, 0x5

    if-eq v0, v2, :cond_37

    const/16 v2, 0x30

    if-eq v0, v2, :cond_32

    const/16 v2, 0x50

    if-eq v0, v2, :cond_2d

    .line 30
    iput v1, p0, Ld/a/a/d$b;->m:I

    goto :goto_40

    .line 31
    :cond_2d
    sget v0, Ld/a/a/g/c;->d:I

    iput v0, p0, Ld/a/a/d$b;->m:I

    goto :goto_40

    .line 32
    :cond_32
    sget v0, Ld/a/a/g/c;->c:I

    iput v0, p0, Ld/a/a/d$b;->m:I

    goto :goto_40

    .line 33
    :cond_37
    sget v0, Ld/a/a/g/c;->f:I

    iput v0, p0, Ld/a/a/d$b;->m:I

    goto :goto_40

    .line 34
    :cond_3c
    sget v0, Ld/a/a/g/c;->e:I

    iput v0, p0, Ld/a/a/d$b;->m:I

    .line 35
    :cond_40
    :goto_40
    iget-object v0, p0, Ld/a/a/d$b;->i:Landroid/content/Context;

    iget v1, p0, Ld/a/a/d$b;->l:I

    invoke-virtual {p0, v0, v1}, Ld/a/a/d$b;->a(Landroid/content/Context;I)Ld/a/a/d;

    move-result-object v0

    iput-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    .line 36
    iget-object v1, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    invoke-virtual {v0, v1}, Lb/b/k/d;->setContentView(Landroid/view/View;)V

    .line 37
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    iget-boolean v1, p0, Ld/a/a/d$b;->s:Z

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 38
    iget-boolean v0, p0, Ld/a/a/d$b;->s:Z

    if-eqz v0, :cond_61

    .line 39
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    iget-boolean v1, p0, Ld/a/a/d$b;->t:Z

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 40
    :cond_61
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    iget-object v1, p0, Ld/a/a/d$b;->x:Ljava/util/List;

    invoke-static {v0, v1}, Ld/a/a/d;->a(Ld/a/a/d;Ljava/util/List;)V

    .line 41
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    iget-object v1, p0, Ld/a/a/d$b;->y:Ljava/util/List;

    invoke-static {v0, v1}, Ld/a/a/d;->b(Ld/a/a/d;Ljava/util/List;)V

    .line 42
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    iget-object v1, p0, Ld/a/a/d$b;->z:Ljava/util/List;

    invoke-static {v0, v1}, Ld/a/a/d;->c(Ld/a/a/d;Ljava/util/List;)V

    .line 43
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    iget-object v1, p0, Ld/a/a/d$b;->A:Ld/a/a/d$l;

    invoke-virtual {v0, v1}, Ld/a/a/d;->a(Ld/a/a/d$l;)V

    .line 44
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_b5

    .line 45
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 46
    iget v2, p0, Ld/a/a/d$b;->n:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 47
    iget v2, p0, Ld/a/a/d$b;->o:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 48
    iget v2, p0, Ld/a/a/d$b;->p:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 49
    iget v2, p0, Ld/a/a/d$b;->q:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 50
    iget v2, p0, Ld/a/a/d$b;->r:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 51
    iget v2, p0, Ld/a/a/d$b;->m:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 52
    iget-boolean v2, p0, Ld/a/a/d$b;->u:Z

    const/4 v3, 0x2

    if-eqz v2, :cond_af

    .line 53
    invoke-virtual {v0, v3}, Landroid/view/Window;->addFlags(I)V

    .line 54
    iget v2, p0, Ld/a/a/d$b;->v:F

    invoke-virtual {v0, v2}, Landroid/view/Window;->setDimAmount(F)V

    goto :goto_b2

    .line 55
    :cond_af
    invoke-virtual {v0, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 56
    :goto_b2
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_b5
    const/4 v0, 0x0

    .line 57
    :goto_b6
    iget-object v1, p0, Ld/a/a/d$b;->B:Landroid/util/SparseArray;

    if-eqz v1, :cond_e4

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_e4

    .line 58
    iget-object v1, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    iget-object v2, p0, Ld/a/a/d$b;->B:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_e1

    .line 59
    new-instance v2, Ld/a/a/d$q;

    iget-object v3, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    iget-object v4, p0, Ld/a/a/d$b;->B:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ld/a/a/d$i;

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Ld/a/a/d$q;-><init>(Ld/a/a/d;Ld/a/a/d$i;Ld/a/a/d$a;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_e1
    add-int/lit8 v0, v0, 0x1

    goto :goto_b6

    .line 60
    :cond_e4
    iget-object v0, p0, Ld/a/a/d$b;->h:Landroid/app/Activity;

    if-eqz v0, :cond_ed

    .line 61
    iget-object v1, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-static {v0, v1}, Ld/a/a/d$d;->a(Landroid/app/Activity;Ld/a/a/d;)V

    .line 62
    :cond_ed
    iget-object v0, p0, Ld/a/a/d$b;->w:Ld/a/a/d$j;

    if-eqz v0, :cond_f6

    .line 63
    iget-object v1, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-interface {v0, v1}, Ld/a/a/d$j;->a(Ld/a/a/d;)V

    .line 64
    :cond_f6
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    return-object v0

    .line 65
    :cond_f9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "are you ok?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Landroid/content/Context;I)Ld/a/a/d;
    .registers 4

    .line 66
    new-instance v0, Ld/a/a/d;

    invoke-direct {v0, p1, p2}, Ld/a/a/d;-><init>(Landroid/content/Context;I)V

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

.method public final a(Ljava/lang/Runnable;)V
    .registers 4

    .line 67
    invoke-virtual {p0}, Ld/a/a/d$b;->g()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 68
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-interface {v0, p1}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;)Z

    goto :goto_15

    .line 69
    :cond_c
    new-instance v0, Ld/a/a/d$p;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ld/a/a/d$p;-><init>(Ljava/lang/Runnable;Ld/a/a/d$a;)V

    invoke-virtual {p0, v0}, Ld/a/a/d$b;->a(Ld/a/a/d$m;)Ld/a/a/d$b;

    :goto_15
    return-void
.end method

.method public final a(Ljava/lang/Runnable;J)V
    .registers 6

    .line 70
    invoke-virtual {p0}, Ld/a/a/d$b;->g()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 71
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-interface {v0, p1, p2, p3}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    goto :goto_15

    .line 72
    :cond_c
    new-instance v0, Ld/a/a/d$o;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Ld/a/a/d$o;-><init>(Ljava/lang/Runnable;JLd/a/a/d$a;)V

    invoke-virtual {p0, v0}, Ld/a/a/d$b;->a(Ld/a/a/d$m;)Ld/a/a/d$b;

    :goto_15
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

.method public b(I)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    iput p1, p0, Ld/a/a/d$b;->m:I

    .line 2
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 3
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Ld/a/a/d;->f(I)V

    :cond_d
    return-object p0
.end method

.method public b(Z)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TB;"
        }
    .end annotation

    .line 4
    iput-boolean p1, p0, Ld/a/a/d$b;->s:Z

    .line 5
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 6
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    :cond_d
    return-object p0
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

.method public b()V
    .registers 2

    .line 7
    iget-object v0, p0, Ld/a/a/d$b;->h:Landroid/app/Activity;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object v0, p0, Ld/a/a/d$b;->h:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_1b

    .line 8
    :cond_13
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    if-nez v0, :cond_18

    return-void

    .line 9
    :cond_18
    invoke-virtual {v0}, Ld/a/a/d;->dismiss()V

    :cond_1b
    :goto_1b
    return-void
.end method

.method public synthetic b(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/h;->a(Ld/a/a/g/i;Landroid/view/View;)V

    return-void
.end method

.method public c(I)Ld/a/a/d$b;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/a/d$b;->i:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v2, p0, Ld/a/a/d$b;->i:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/a/d$b;->a(Landroid/view/View;)Ld/a/a/d$b;

    return-object p0
.end method

.method public c(Z)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TB;"
        }
    .end annotation

    .line 2
    iput-boolean p1, p0, Ld/a/a/d$b;->t:Z

    .line 3
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Ld/a/a/d$b;->s:Z

    if-eqz v0, :cond_11

    .line 4
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    :cond_11
    return-object p0
.end method

.method public c()Ld/a/a/d;
    .registers 2

    .line 5
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    return-object v0
.end method

.method public synthetic d()Landroid/content/res/Resources;
    .registers 2

    invoke-static {p0}, Ld/a/a/g/j;->a(Ld/a/a/g/k;)Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public d(I)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ld/a/a/g/k;->d()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    invoke-static {p1, v0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v0

    iput v0, p0, Ld/a/a/d$b;->p:I

    .line 2
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 3
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Ld/a/a/d;->c(I)V

    :cond_1d
    return-object p0
.end method

.method public e(I)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    iput p1, p0, Ld/a/a/d$b;->o:I

    .line 2
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 3
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Ld/a/a/d;->d(I)V

    return-object p0

    .line 4
    :cond_e
    iget-object v0, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    if-eqz v0, :cond_21

    .line 5
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 6
    iget-object p1, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_21
    return-object p0
.end method

.method public e()Z
    .registers 2

    .line 7
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public synthetic f()Landroid/app/Activity;
    .registers 2

    invoke-static {p0}, Ld/a/a/g/a;->a(Ld/a/a/g/b;)Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public f(I)Ld/a/a/d$b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    iput p1, p0, Ld/a/a/d$b;->n:I

    .line 2
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 3
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0, p1}, Ld/a/a/d;->e(I)V

    return-object p0

    .line 4
    :cond_e
    iget-object v0, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    if-eqz v0, :cond_21

    .line 5
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 6
    iget-object p1, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_21
    return-object p0
.end method

.method public findViewById(I)Landroid/view/View;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(I)TV;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/a/d$b;->k:Landroid/view/View;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 3
    :cond_9
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "are you ok?"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public g()Z
    .registers 2

    .line 1
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/a/d$b;->i:Landroid/content/Context;

    return-object v0
.end method

.method public h()V
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/a/d$b;->h:Landroid/app/Activity;

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p0, Ld/a/a/d$b;->h:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_28

    .line 2
    :cond_13
    invoke-virtual {p0}, Ld/a/a/d$b;->e()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 3
    invoke-virtual {p0}, Ld/a/a/d$b;->a()Ld/a/a/d;

    .line 4
    :cond_1c
    invoke-virtual {p0}, Ld/a/a/d$b;->g()Z

    move-result v0

    if-eqz v0, :cond_23

    return-void

    .line 5
    :cond_23
    iget-object v0, p0, Ld/a/a/d$b;->j:Ld/a/a/d;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    :cond_28
    :goto_28
    return-void
.end method

.method public synthetic onClick(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View;)V

    return-void
.end method

.method public synthetic startActivity(Landroid/content/Intent;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/a;->a(Ld/a/a/g/b;Landroid/content/Intent;)V

    return-void
.end method
