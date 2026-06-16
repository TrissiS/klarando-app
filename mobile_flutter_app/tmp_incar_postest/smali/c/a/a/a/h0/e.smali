.class public final Lc/a/a/a/h0/e;
.super Lc/a/a/a/h0/i;
.source "CircularIndeterminateAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/a/a/a/h0/i<",
        "Landroid/animation/ObjectAnimator;",
        ">;"
    }
.end annotation


# static fields
.field public static final l:[I

.field public static final m:[I

.field public static final n:[I

.field public static final o:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lc/a/a/a/h0/e;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final p:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lc/a/a/a/h0/e;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public d:Landroid/animation/ObjectAnimator;

.field public e:Landroid/animation/ObjectAnimator;

.field public final f:Lb/m/a/a/b;

.field public final g:Lc/a/a/a/h0/c;

.field public h:I

.field public i:F

.field public j:F

.field public k:Lb/t/a/a/b$a;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    const-class v0, Ljava/lang/Float;

    const/4 v1, 0x4

    new-array v2, v1, [I

    fill-array-data v2, :array_2c

    sput-object v2, Lc/a/a/a/h0/e;->l:[I

    new-array v2, v1, [I

    .line 2
    fill-array-data v2, :array_38

    sput-object v2, Lc/a/a/a/h0/e;->m:[I

    new-array v1, v1, [I

    .line 3
    fill-array-data v1, :array_44

    sput-object v1, Lc/a/a/a/h0/e;->n:[I

    .line 4
    new-instance v1, Lc/a/a/a/h0/e$c;

    const-string v2, "animationFraction"

    invoke-direct {v1, v0, v2}, Lc/a/a/a/h0/e$c;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v1, Lc/a/a/a/h0/e;->o:Landroid/util/Property;

    .line 5
    new-instance v1, Lc/a/a/a/h0/e$d;

    const-string v2, "completeEndFraction"

    invoke-direct {v1, v0, v2}, Lc/a/a/a/h0/e$d;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v1, Lc/a/a/a/h0/e;->p:Landroid/util/Property;

    return-void

    nop

    :array_2c
    .array-data 4
        0x0
        0x546
        0xa8c
        0xfd2
    .end array-data

    :array_38
    .array-data 4
        0x29b
        0x7e1
        0xd27
        0x126d
    .end array-data

    :array_44
    .array-data 4
        0x3e8
        0x92e
        0xe74
        0x13ba
    .end array-data
.end method

.method public constructor <init>(Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lc/a/a/a/h0/i;-><init>(I)V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lc/a/a/a/h0/e;->h:I

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lc/a/a/a/h0/e;->k:Lb/t/a/a/b$a;

    .line 4
    iput-object p1, p0, Lc/a/a/a/h0/e;->g:Lc/a/a/a/h0/c;

    .line 5
    new-instance p1, Lb/m/a/a/b;

    invoke-direct {p1}, Lb/m/a/a/b;-><init>()V

    iput-object p1, p0, Lc/a/a/a/h0/e;->f:Lb/m/a/a/b;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/h0/e;)I
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/h0/e;->h:I

    return p0
.end method

.method public static synthetic a(Lc/a/a/a/h0/e;I)I
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/h0/e;->h:I

    return p1
.end method

.method public static synthetic a(Lc/a/a/a/h0/e;F)V
    .registers 2

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/e;->b(F)V

    return-void
.end method

.method public static synthetic b(Lc/a/a/a/h0/e;)Lc/a/a/a/h0/c;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/h0/e;->g:Lc/a/a/a/h0/c;

    return-object p0
.end method

.method public static synthetic c(Lc/a/a/a/h0/e;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/e;->f()F

    move-result p0

    return p0
.end method

.method public static synthetic d(Lc/a/a/a/h0/e;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/e;->g()F

    move-result p0

    return p0
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/e;->d:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_7

    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_7
    return-void
.end method

.method public a(F)V
    .registers 3

    .line 20
    iput p1, p0, Lc/a/a/a/h0/e;->i:F

    const v0, 0x45a8c000    # 5400.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 21
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/e;->b(I)V

    .line 22
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/e;->a(I)V

    .line 23
    iget-object p1, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final a(I)V
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/4 v2, 0x4

    if-ge v1, v2, :cond_65

    .line 7
    sget-object v2, Lc/a/a/a/h0/e;->n:[I

    aget v2, v2, v1

    const/16 v3, 0x14d

    .line 8
    invoke-virtual {p0, p1, v2, v3}, Lc/a/a/a/h0/i;->a(III)F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_62

    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v3, v2, v3

    if-gtz v3, :cond_62

    .line 9
    iget p1, p0, Lc/a/a/a/h0/e;->h:I

    add-int/2addr v1, p1

    iget-object p1, p0, Lc/a/a/a/h0/e;->g:Lc/a/a/a/h0/c;

    iget-object p1, p1, Lc/a/a/a/h0/c;->c:[I

    array-length v3, p1

    rem-int/2addr v1, v3

    add-int/lit8 v3, v1, 0x1

    .line 10
    array-length v4, p1

    rem-int/2addr v3, v4

    .line 11
    aget p1, p1, v1

    iget-object v1, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    .line 12
    invoke-virtual {v1}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v1

    .line 13
    invoke-static {p1, v1}, Lc/a/a/a/w/a;->a(II)I

    move-result p1

    .line 14
    iget-object v1, p0, Lc/a/a/a/h0/e;->g:Lc/a/a/a/h0/c;

    iget-object v1, v1, Lc/a/a/a/h0/c;->c:[I

    aget v1, v1, v3

    iget-object v3, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    .line 15
    invoke-virtual {v3}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v3

    .line 16
    invoke-static {v1, v3}, Lc/a/a/a/w/a;->a(II)I

    move-result v1

    .line 17
    iget-object v3, p0, Lc/a/a/a/h0/e;->f:Lb/m/a/a/b;

    invoke-virtual {v3, v2}, Lb/m/a/a/d;->getInterpolation(F)F

    move-result v2

    .line 18
    iget-object v3, p0, Lc/a/a/a/h0/i;->c:[I

    .line 19
    invoke-static {}, Lc/a/a/a/m/c;->a()Lc/a/a/a/m/c;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v4, v2, p1, v1}, Lc/a/a/a/m/c;->a(FLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aput p1, v3, v0

    goto :goto_65

    :cond_62
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_65
    :goto_65
    return-void
.end method

.method public a(Lb/t/a/a/b$a;)V
    .registers 2

    .line 6
    iput-object p1, p0, Lc/a/a/a/h0/e;->k:Lb/t/a/a/b$a;

    return-void
.end method

.method public b()V
    .registers 1

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/e;->i()V

    return-void
.end method

.method public final b(F)V
    .registers 2

    .line 14
    iput p1, p0, Lc/a/a/a/h0/e;->j:F

    return-void
.end method

.method public final b(I)V
    .registers 10

    .line 3
    iget-object v0, p0, Lc/a/a/a/h0/i;->b:[F

    iget v1, p0, Lc/a/a/a/h0/e;->i:F

    const/high16 v2, 0x44be0000    # 1520.0f

    mul-float v3, v1, v2

    const/high16 v4, -0x3e600000    # -20.0f

    add-float/2addr v3, v4

    const/4 v4, 0x0

    aput v3, v0, v4

    mul-float v1, v1, v2

    const/4 v2, 0x1

    .line 4
    aput v1, v0, v2

    const/4 v0, 0x0

    :goto_14
    const/4 v1, 0x4

    if-ge v0, v1, :cond_4c

    .line 5
    sget-object v1, Lc/a/a/a/h0/e;->l:[I

    aget v1, v1, v0

    const/16 v3, 0x29b

    .line 6
    invoke-virtual {p0, p1, v1, v3}, Lc/a/a/a/h0/i;->a(III)F

    move-result v1

    .line 7
    iget-object v5, p0, Lc/a/a/a/h0/i;->b:[F

    aget v6, v5, v2

    iget-object v7, p0, Lc/a/a/a/h0/e;->f:Lb/m/a/a/b;

    invoke-virtual {v7, v1}, Lb/m/a/a/d;->getInterpolation(F)F

    move-result v1

    const/high16 v7, 0x437a0000    # 250.0f

    mul-float v1, v1, v7

    add-float/2addr v6, v1

    aput v6, v5, v2

    .line 8
    sget-object v1, Lc/a/a/a/h0/e;->m:[I

    aget v1, v1, v0

    .line 9
    invoke-virtual {p0, p1, v1, v3}, Lc/a/a/a/h0/i;->a(III)F

    move-result v1

    .line 10
    iget-object v3, p0, Lc/a/a/a/h0/i;->b:[F

    aget v5, v3, v4

    iget-object v6, p0, Lc/a/a/a/h0/e;->f:Lb/m/a/a/b;

    invoke-virtual {v6, v1}, Lb/m/a/a/d;->getInterpolation(F)F

    move-result v1

    mul-float v1, v1, v7

    add-float/2addr v5, v1

    aput v5, v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 11
    :cond_4c
    iget-object p1, p0, Lc/a/a/a/h0/i;->b:[F

    aget v0, p1, v4

    aget v1, p1, v2

    aget v3, p1, v4

    sub-float/2addr v1, v3

    iget v3, p0, Lc/a/a/a/h0/e;->j:F

    mul-float v1, v1, v3

    add-float/2addr v0, v1

    aput v0, p1, v4

    .line 12
    aget v0, p1, v4

    const/high16 v1, 0x43b40000    # 360.0f

    div-float/2addr v0, v1

    aput v0, p1, v4

    .line 13
    aget v0, p1, v2

    div-float/2addr v0, v1

    aput v0, p1, v2

    return-void
.end method

.method public c()V
    .registers 2

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/e;->e:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 3
    :cond_9
    iget-object v0, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/e;->e:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_1a

    .line 5
    :cond_17
    invoke-virtual {p0}, Lc/a/a/a/h0/e;->a()V

    :goto_1a
    return-void
.end method

.method public d()V
    .registers 2

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/e;->h()V

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/h0/e;->i()V

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/e;->d:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public e()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lc/a/a/a/h0/e;->k:Lb/t/a/a/b$a;

    return-void
.end method

.method public final f()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/h0/e;->i:F

    return v0
.end method

.method public final g()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/h0/e;->j:F

    return v0
.end method

.method public final h()V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/e;->d:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x2

    if-nez v0, :cond_2d

    .line 2
    sget-object v0, Lc/a/a/a/h0/e;->o:Landroid/util/Property;

    new-array v2, v1, [F

    fill-array-data v2, :array_56

    invoke-static {p0, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/h0/e;->d:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0x1518

    .line 3
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/e;->d:Landroid/animation/ObjectAnimator;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/h0/e;->d:Landroid/animation/ObjectAnimator;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/h0/e;->d:Landroid/animation/ObjectAnimator;

    new-instance v2, Lc/a/a/a/h0/e$a;

    invoke-direct {v2, p0}, Lc/a/a/a/h0/e$a;-><init>(Lc/a/a/a/h0/e;)V

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 7
    :cond_2d
    iget-object v0, p0, Lc/a/a/a/h0/e;->e:Landroid/animation/ObjectAnimator;

    if-nez v0, :cond_54

    .line 8
    sget-object v0, Lc/a/a/a/h0/e;->p:Landroid/util/Property;

    new-array v1, v1, [F

    fill-array-data v1, :array_5e

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/h0/e;->e:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x14d

    .line 9
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 10
    iget-object v0, p0, Lc/a/a/a/h0/e;->e:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lc/a/a/a/h0/e;->f:Lb/m/a/a/b;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 11
    iget-object v0, p0, Lc/a/a/a/h0/e;->e:Landroid/animation/ObjectAnimator;

    new-instance v1, Lc/a/a/a/h0/e$b;

    invoke-direct {v1, p0}, Lc/a/a/a/h0/e$b;-><init>(Lc/a/a/a/h0/e;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_54
    return-void

    nop

    :array_56
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_5e
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public i()V
    .registers 5

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lc/a/a/a/h0/e;->h:I

    .line 2
    iget-object v1, p0, Lc/a/a/a/h0/i;->c:[I

    iget-object v2, p0, Lc/a/a/a/h0/e;->g:Lc/a/a/a/h0/c;

    iget-object v2, v2, Lc/a/a/a/h0/c;->c:[I

    aget v2, v2, v0

    iget-object v3, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    .line 3
    invoke-virtual {v3}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v3

    invoke-static {v2, v3}, Lc/a/a/a/w/a;->a(II)I

    move-result v2

    aput v2, v1, v0

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lc/a/a/a/h0/e;->j:F

    return-void
.end method
