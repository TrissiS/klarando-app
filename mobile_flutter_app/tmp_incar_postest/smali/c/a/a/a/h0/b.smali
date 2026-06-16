.class public abstract Lc/a/a/a/h0/b;
.super Landroid/widget/ProgressBar;
.source "BaseProgressIndicator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lc/a/a/a/h0/c;",
        ">",
        "Landroid/widget/ProgressBar;"
    }
.end annotation


# static fields
.field public static final u:I


# instance fields
.field public h:Lc/a/a/a/h0/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field public i:I

.field public j:Z

.field public k:Z

.field public final l:I

.field public m:J

.field public n:Lc/a/a/a/h0/a;

.field public o:Z

.field public p:I

.field public final q:Ljava/lang/Runnable;

.field public final r:Ljava/lang/Runnable;

.field public final s:Lb/t/a/a/b$a;

.field public final t:Lb/t/a/a/b$a;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_MaterialComponents_ProgressIndicator:I

    sput v0, Lc/a/a/a/h0/b;->u:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 12

    .line 1
    sget v0, Lc/a/a/a/h0/b;->u:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/h0/b;->o:Z

    const/4 v0, 0x4

    .line 3
    iput v0, p0, Lc/a/a/a/h0/b;->p:I

    .line 4
    new-instance v0, Lc/a/a/a/h0/b$a;

    invoke-direct {v0, p0}, Lc/a/a/a/h0/b$a;-><init>(Lc/a/a/a/h0/b;)V

    iput-object v0, p0, Lc/a/a/a/h0/b;->q:Ljava/lang/Runnable;

    .line 5
    new-instance v0, Lc/a/a/a/h0/b$b;

    invoke-direct {v0, p0}, Lc/a/a/a/h0/b$b;-><init>(Lc/a/a/a/h0/b;)V

    iput-object v0, p0, Lc/a/a/a/h0/b;->r:Ljava/lang/Runnable;

    .line 6
    new-instance v0, Lc/a/a/a/h0/b$c;

    invoke-direct {v0, p0}, Lc/a/a/a/h0/b$c;-><init>(Lc/a/a/a/h0/b;)V

    iput-object v0, p0, Lc/a/a/a/h0/b;->s:Lb/t/a/a/b$a;

    .line 7
    new-instance v0, Lc/a/a/a/h0/b$d;

    invoke-direct {v0, p0}, Lc/a/a/a/h0/b$d;-><init>(Lc/a/a/a/h0/b;)V

    iput-object v0, p0, Lc/a/a/a/h0/b;->t:Lb/t/a/a/b$a;

    .line 8
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 9
    invoke-virtual {p0, v1, p2}, Lc/a/a/a/h0/b;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Lc/a/a/a/h0/c;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    .line 10
    sget-object v3, Lc/a/a/a/l;->BaseProgressIndicator:[I

    new-array v6, p1, [I

    move-object v2, p2

    move v4, p3

    move v5, p4

    .line 11
    invoke-static/range {v1 .. v6}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 12
    sget p2, Lc/a/a/a/l;->BaseProgressIndicator_showDelay:I

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 13
    sget p2, Lc/a/a/a/l;->BaseProgressIndicator_minHideDelay:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    const/16 p3, 0x3e8

    .line 14
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    iput p2, p0, Lc/a/a/a/h0/b;->l:I

    .line 15
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 16
    new-instance p1, Lc/a/a/a/h0/a;

    invoke-direct {p1}, Lc/a/a/a/h0/a;-><init>()V

    iput-object p1, p0, Lc/a/a/a/h0/b;->n:Lc/a/a/a/h0/a;

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lc/a/a/a/h0/b;->k:Z

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/h0/b;J)J
    .registers 3

    .line 2
    iput-wide p1, p0, Lc/a/a/a/h0/b;->m:J

    return-wide p1
.end method

.method public static synthetic a(Lc/a/a/a/h0/b;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->b()V

    return-void
.end method

.method public static synthetic b(Lc/a/a/a/h0/b;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->a()V

    return-void
.end method

.method public static synthetic c(Lc/a/a/a/h0/b;)I
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/h0/b;->i:I

    return p0
.end method

.method public static synthetic d(Lc/a/a/a/h0/b;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lc/a/a/a/h0/b;->j:Z

    return p0
.end method

.method public static synthetic e(Lc/a/a/a/h0/b;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lc/a/a/a/h0/b;->o:Z

    return p0
.end method

.method public static synthetic f(Lc/a/a/a/h0/b;)I
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/h0/b;->p:I

    return p0
.end method

.method private getCurrentDrawingDelegate()Lc/a/a/a/h0/h;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lc/a/a/a/h0/h<",
            "TS;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    if-nez v0, :cond_e

    goto :goto_16

    .line 3
    :cond_e
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/h0/j;->i()Lc/a/a/a/h0/h;

    move-result-object v1

    :goto_16
    return-object v1

    .line 4
    :cond_17
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    if-nez v0, :cond_1e

    goto :goto_26

    :cond_1e
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/h0/f;->h()Lc/a/a/a/h0/h;

    move-result-object v1

    :goto_26
    return-object v1
.end method


# virtual methods
.method public abstract a(Landroid/content/Context;Landroid/util/AttributeSet;)Lc/a/a/a/h0/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/util/AttributeSet;",
            ")TS;"
        }
    .end annotation
.end method

.method public final a()V
    .registers 4

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/h0/g;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 4
    invoke-virtual {v0, v1, v1, v2}, Lc/a/a/a/h0/g;->a(ZZZ)Z

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->d()Z

    move-result v0

    if-eqz v0, :cond_15

    const/4 v0, 0x4

    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_15
    return-void
.end method

.method public a(IZ)V
    .registers 4

    .line 10
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0

    if-eqz v0, :cond_47

    .line 11
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    if-eqz v0, :cond_59

    .line 12
    iput p1, p0, Lc/a/a/a/h0/b;->i:I

    .line 13
    iput-boolean p2, p0, Lc/a/a/a/h0/b;->j:Z

    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lc/a/a/a/h0/b;->o:Z

    .line 15
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_3d

    iget-object p1, p0, Lc/a/a/a/h0/b;->n:Lc/a/a/a/h0/a;

    .line 16
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Lc/a/a/a/h0/a;->a(Landroid/content/ContentResolver;)F

    move-result p1

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-nez p1, :cond_31

    goto :goto_3d

    .line 18
    :cond_31
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/h0/j;->h()Lc/a/a/a/h0/i;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/h0/i;->c()V

    goto :goto_59

    .line 19
    :cond_3d
    :goto_3d
    iget-object p1, p0, Lc/a/a/a/h0/b;->s:Lb/t/a/a/b$a;

    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object p2

    invoke-virtual {p1, p2}, Lb/t/a/a/b$a;->a(Landroid/graphics/drawable/Drawable;)V

    goto :goto_59

    .line 20
    :cond_47
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 21
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object p1

    if-eqz p1, :cond_59

    if-nez p2, :cond_59

    .line 22
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/h0/f;->jumpToCurrentState()V

    :cond_59
    :goto_59
    return-void
.end method

.method public a(Z)V
    .registers 5

    .line 7
    iget-boolean v0, p0, Lc/a/a/a/h0/b;->k:Z

    if-nez v0, :cond_5

    return-void

    .line 8
    :cond_5
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/h0/g;

    .line 9
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->g()Z

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lc/a/a/a/h0/g;->a(ZZZ)Z

    return-void
.end method

.method public final b()V
    .registers 2

    .line 2
    iget v0, p0, Lc/a/a/a/h0/b;->l:I

    if-lez v0, :cond_7

    .line 3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    :cond_7
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public c()Z
    .registers 4

    move-object v0, p0

    .line 2
    :goto_1
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    return v2

    .line 3
    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_18

    .line 4
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_17

    const/4 v2, 0x1

    :cond_17
    return v2

    .line 5
    :cond_18
    instance-of v2, v0, Landroid/view/View;

    if-nez v2, :cond_1d

    return v1

    .line 6
    :cond_1d
    check-cast v0, Landroid/view/View;

    goto :goto_1
.end method

.method public final d()Z
    .registers 2

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-nez v0, :cond_21

    .line 3
    :cond_10
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-nez v0, :cond_21

    goto :goto_23

    :cond_21
    const/4 v0, 0x0

    goto :goto_24

    :cond_23
    :goto_23
    const/4 v0, 0x1

    :goto_24
    return v0
.end method

.method public final e()V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Lc/a/a/a/h0/j;->h()Lc/a/a/a/h0/i;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/h0/b;->s:Lb/t/a/a/b$a;

    .line 5
    invoke-virtual {v0, v1}, Lc/a/a/a/h0/i;->a(Lb/t/a/a/b$a;)V

    .line 6
    :cond_19
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    if-eqz v0, :cond_28

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/h0/b;->t:Lb/t/a/a/b$a;

    invoke-virtual {v0, v1}, Lc/a/a/a/h0/g;->a(Lb/t/a/a/b$a;)V

    .line 8
    :cond_28
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    if-eqz v0, :cond_37

    .line 9
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/h0/b;->t:Lb/t/a/a/b$a;

    invoke-virtual {v0, v1}, Lc/a/a/a/h0/g;->a(Lb/t/a/a/b$a;)V

    :cond_37
    return-void
.end method

.method public final f()V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/h0/b;->t:Lb/t/a/a/b$a;

    invoke-virtual {v0, v1}, Lc/a/a/a/h0/g;->b(Lb/t/a/a/b$a;)Z

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/h0/j;->h()Lc/a/a/a/h0/i;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/h0/i;->e()V

    .line 5
    :cond_1a
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/h0/b;->t:Lb/t/a/a/b$a;

    invoke-virtual {v0, v1}, Lc/a/a/a/h0/g;->b(Lb/t/a/a/b$a;)Z

    :cond_29
    return-void
.end method

.method public g()Z
    .registers 2

    .line 1
    invoke-static {p0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 2
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_14

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->c()Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public getCurrentDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    goto :goto_f

    :cond_b
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    :goto_f
    return-object v0
.end method

.method public getHideAnimationBehavior()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v0, v0, Lc/a/a/a/h0/c;->f:I

    return v0
.end method

.method public bridge synthetic getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    return-object v0
.end method

.method public getIndeterminateDrawable()Lc/a/a/a/h0/j;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lc/a/a/a/h0/j<",
            "TS;>;"
        }
    .end annotation

    .line 2
    invoke-super {p0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/h0/j;

    return-object v0
.end method

.method public getIndicatorColor()[I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget-object v0, v0, Lc/a/a/a/h0/c;->c:[I

    return-object v0
.end method

.method public bridge synthetic getProgressDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    return-object v0
.end method

.method public getProgressDrawable()Lc/a/a/a/h0/f;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lc/a/a/a/h0/f<",
            "TS;>;"
        }
    .end annotation

    .line 2
    invoke-super {p0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/h0/f;

    return-object v0
.end method

.method public getShowAnimationBehavior()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v0, v0, Lc/a/a/a/h0/c;->e:I

    return v0
.end method

.method public getTrackColor()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v0, v0, Lc/a/a/a/h0/c;->d:I

    return v0
.end method

.method public getTrackCornerRadius()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v0, v0, Lc/a/a/a/h0/c;->b:I

    return v0
.end method

.method public getTrackThickness()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v0, v0, Lc/a/a/a/h0/c;->a:I

    return v0
.end method

.method public invalidate()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/ProgressBar;->invalidate()V

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_10
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/ProgressBar;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->e()V

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->g()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->b()V

    :cond_f
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->r:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/b;->q:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/h0/g;

    invoke-virtual {v0}, Lc/a/a/a/h0/g;->d()Z

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->f()V

    .line 5
    invoke-super {p0}, Landroid/widget/ProgressBar;->onDetachedFromWindow()V

    return-void
.end method

.method public declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .registers 7

    monitor-enter p0

    .line 1
    :try_start_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 2
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingLeft()I

    move-result v1

    if-nez v1, :cond_11

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingTop()I

    move-result v1

    if-eqz v1, :cond_1e

    .line 3
    :cond_11
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 4
    :cond_1e
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingRight()I

    move-result v1

    if-nez v1, :cond_2a

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingBottom()I

    move-result v1

    if-eqz v1, :cond_4a

    .line 5
    :cond_2a
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    sub-int/2addr v1, v2

    .line 6
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    sub-int/2addr v2, v3

    const/4 v3, 0x0

    .line 7
    invoke-virtual {p1, v3, v3, v1, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 8
    :cond_4a
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 9
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V
    :try_end_54
    .catchall {:try_start_1 .. :try_end_54} :catchall_56

    .line 10
    monitor-exit p0

    return-void

    :catchall_56
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onMeasure(II)V
    .registers 4

    monitor-enter p0

    .line 1
    :try_start_1
    invoke-super {p0, p1, p2}, Landroid/widget/ProgressBar;->onMeasure(II)V

    .line 2
    invoke-direct {p0}, Lc/a/a/a/h0/b;->getCurrentDrawingDelegate()Lc/a/a/a/h0/h;

    move-result-object p1
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_3b

    if-nez p1, :cond_c

    .line 3
    monitor-exit p0

    return-void

    .line 4
    :cond_c
    :try_start_c
    invoke-virtual {p1}, Lc/a/a/a/h0/h;->b()I

    move-result p2

    .line 5
    invoke-virtual {p1}, Lc/a/a/a/h0/h;->a()I

    move-result p1

    if-gez p2, :cond_1b

    .line 6
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getMeasuredWidth()I

    move-result p2

    goto :goto_25

    .line 7
    :cond_1b
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingLeft()I

    move-result v0

    add-int/2addr p2, v0

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingRight()I

    move-result v0

    add-int/2addr p2, v0

    :goto_25
    if-gez p1, :cond_2c

    .line 8
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getMeasuredHeight()I

    move-result p1

    goto :goto_36

    .line 9
    :cond_2c
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingTop()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getPaddingBottom()I

    move-result v0

    add-int/2addr p1, v0

    .line 10
    :goto_36
    invoke-virtual {p0, p2, p1}, Landroid/widget/ProgressBar;->setMeasuredDimension(II)V
    :try_end_39
    .catchall {:try_start_c .. :try_end_39} :catchall_3b

    .line 11
    monitor-exit p0

    return-void

    :catchall_3b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/ProgressBar;->onVisibilityChanged(Landroid/view/View;I)V

    if-nez p2, :cond_7

    const/4 p1, 0x1

    goto :goto_8

    :cond_7
    const/4 p1, 0x0

    .line 2
    :goto_8
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/b;->a(Z)V

    return-void
.end method

.method public onWindowVisibilityChanged(I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->onWindowVisibilityChanged(I)V

    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/b;->a(Z)V

    return-void
.end method

.method public setAnimatorDurationScaleProvider(Lc/a/a/a/h0/a;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/b;->n:Lc/a/a/a/h0/a;

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getProgressDrawable()Lc/a/a/a/h0/f;

    move-result-object v0

    iput-object p1, v0, Lc/a/a/a/h0/g;->j:Lc/a/a/a/h0/a;

    .line 4
    :cond_e
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object v0

    iput-object p1, v0, Lc/a/a/a/h0/g;->j:Lc/a/a/a/h0/a;

    :cond_1a
    return-void
.end method

.method public setHideAnimationBehavior(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iput p1, v0, Lc/a/a/a/h0/c;->f:I

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->invalidate()V

    return-void
.end method

.method public declared-synchronized setIndeterminate(Z)V
    .registers 4

    monitor-enter p0

    .line 1
    :try_start_1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_3c

    if-ne p1, v0, :cond_9

    .line 2
    monitor-exit p0

    return-void

    .line 3
    :cond_9
    :try_start_9
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->g()Z

    move-result v0

    if-eqz v0, :cond_1a

    if-nez p1, :cond_12

    goto :goto_1a

    .line 4
    :cond_12
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot switch to indeterminate mode while the progress indicator is visible."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 5
    :cond_1a
    :goto_1a
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lc/a/a/a/h0/g;

    if-eqz v0, :cond_25

    .line 6
    invoke-virtual {v0}, Lc/a/a/a/h0/g;->d()Z

    .line 7
    :cond_25
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Lc/a/a/a/h0/g;

    const/4 v0, 0x0

    if-eqz p1, :cond_38

    .line 9
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->g()Z

    move-result v1

    invoke-virtual {p1, v1, v0, v0}, Lc/a/a/a/h0/g;->a(ZZZ)Z

    .line 10
    :cond_38
    iput-boolean v0, p0, Lc/a/a/a/h0/b;->o:Z
    :try_end_3a
    .catchall {:try_start_9 .. :try_end_3a} :catchall_3c

    .line 11
    monitor-exit p0

    return-void

    :catchall_3c
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    if-nez p1, :cond_7

    const/4 p1, 0x0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 2
    :cond_7
    instance-of v0, p1, Lc/a/a/a/h0/j;

    if-eqz v0, :cond_15

    .line 3
    move-object v0, p1

    check-cast v0, Lc/a/a/a/h0/g;

    invoke-virtual {v0}, Lc/a/a/a/h0/g;->d()Z

    .line 4
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 5
    :cond_15
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot set framework drawable as indeterminate drawable."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs setIndicatorColor([I)V
    .registers 6

    .line 1
    array-length v0, p1

    if-nez v0, :cond_14

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lc/a/a/a/b;->colorPrimary:I

    const/4 v3, -0x1

    invoke-static {v1, v2, v3}, Lc/a/a/a/w/a;->a(Landroid/content/Context;II)I

    move-result v1

    aput v1, p1, v0

    .line 3
    :cond_14
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndicatorColor()[I

    move-result-object v0

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_30

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iput-object p1, v0, Lc/a/a/a/h0/c;->c:[I

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->getIndeterminateDrawable()Lc/a/a/a/h0/j;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/h0/j;->h()Lc/a/a/a/h0/i;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/h0/i;->b()V

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->invalidate()V

    :cond_30
    return-void
.end method

.method public declared-synchronized setProgress(I)V
    .registers 3

    monitor-enter p0

    .line 1
    :try_start_1
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_f

    if-eqz v0, :cond_9

    .line 2
    monitor-exit p0

    return-void

    :cond_9
    const/4 v0, 0x0

    .line 3
    :try_start_a
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/h0/b;->a(IZ)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_f

    .line 4
    monitor-exit p0

    return-void

    :catchall_f
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    if-nez p1, :cond_7

    const/4 p1, 0x0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 2
    :cond_7
    instance-of v0, p1, Lc/a/a/a/h0/f;

    if-eqz v0, :cond_22

    .line 3
    check-cast p1, Lc/a/a/a/h0/f;

    .line 4
    invoke-virtual {p1}, Lc/a/a/a/h0/g;->d()Z

    .line 5
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Lc/a/a/a/h0/f;->c(F)V

    return-void

    .line 7
    :cond_22
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot set framework drawable as progress drawable."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setShowAnimationBehavior(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iput p1, v0, Lc/a/a/a/h0/c;->e:I

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->invalidate()V

    return-void
.end method

.method public setTrackColor(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v1, v0, Lc/a/a/a/h0/c;->d:I

    if-eq v1, p1, :cond_b

    .line 2
    iput p1, v0, Lc/a/a/a/h0/c;->d:I

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/b;->invalidate()V

    :cond_b
    return-void
.end method

.method public setTrackCornerRadius(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v1, v0, Lc/a/a/a/h0/c;->b:I

    if-eq v1, p1, :cond_10

    .line 2
    iget v1, v0, Lc/a/a/a/h0/c;->a:I

    div-int/lit8 v1, v1, 0x2

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, v0, Lc/a/a/a/h0/c;->b:I

    :cond_10
    return-void
.end method

.method public setTrackThickness(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b;->h:Lc/a/a/a/h0/c;

    iget v1, v0, Lc/a/a/a/h0/c;->a:I

    if-eq v1, p1, :cond_b

    .line 2
    iput p1, v0, Lc/a/a/a/h0/c;->a:I

    .line 3
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->requestLayout()V

    :cond_b
    return-void
.end method

.method public setVisibilityAfterHide(I)V
    .registers 3

    if-eqz p1, :cond_12

    const/4 v0, 0x4

    if-eq p1, v0, :cond_12

    const/16 v0, 0x8

    if-ne p1, v0, :cond_a

    goto :goto_12

    .line 1
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The component\'s visibility must be one of VISIBLE, INVISIBLE, and GONE defined in View."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2
    :cond_12
    :goto_12
    iput p1, p0, Lc/a/a/a/h0/b;->p:I

    return-void
.end method
