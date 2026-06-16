.class public abstract Lc/a/a/a/h0/g;
.super Landroid/graphics/drawable/Drawable;
.source "DrawableWithAnimatedVisibilityChange.java"

# interfaces
.implements Lb/t/a/a/b;


# static fields
.field public static final v:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lc/a/a/a/h0/g;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final h:Landroid/content/Context;

.field public final i:Lc/a/a/a/h0/c;

.field public j:Lc/a/a/a/h0/a;

.field public k:Landroid/animation/ValueAnimator;

.field public l:Landroid/animation/ValueAnimator;

.field public m:Z

.field public n:Z

.field public o:F

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lb/t/a/a/b$a;",
            ">;"
        }
    .end annotation
.end field

.field public q:Lb/t/a/a/b$a;

.field public r:Z

.field public s:F

.field public final t:Landroid/graphics/Paint;

.field public u:I


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Lc/a/a/a/h0/g$c;

    const-class v1, Ljava/lang/Float;

    const-string v2, "growFraction"

    invoke-direct {v0, v1, v2}, Lc/a/a/a/h0/g$c;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lc/a/a/a/h0/g;->v:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lc/a/a/a/h0/c;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lc/a/a/a/h0/g;->t:Landroid/graphics/Paint;

    .line 3
    iput-object p1, p0, Lc/a/a/a/h0/g;->h:Landroid/content/Context;

    .line 4
    iput-object p2, p0, Lc/a/a/a/h0/g;->i:Lc/a/a/a/h0/c;

    .line 5
    new-instance p1, Lc/a/a/a/h0/a;

    invoke-direct {p1}, Lc/a/a/a/h0/a;-><init>()V

    iput-object p1, p0, Lc/a/a/a/h0/g;->j:Lc/a/a/a/h0/a;

    const/16 p1, 0xff

    .line 6
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/g;->setAlpha(I)V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/h0/g;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/g;->b()V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/h0/g;ZZ)Z
    .registers 3

    .line 2
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lc/a/a/a/h0/g;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/g;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    .line 7
    iget-object v0, p0, Lc/a/a/a/h0/g;->q:Lb/t/a/a/b$a;

    if-eqz v0, :cond_7

    .line 8
    invoke-virtual {v0, p0}, Lb/t/a/a/b$a;->a(Landroid/graphics/drawable/Drawable;)V

    .line 9
    :cond_7
    iget-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    if-eqz v0, :cond_23

    iget-boolean v1, p0, Lc/a/a/a/h0/g;->r:Z

    if-nez v1, :cond_23

    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/t/a/a/b$a;

    .line 11
    invoke-virtual {v1, p0}, Lb/t/a/a/b$a;->a(Landroid/graphics/drawable/Drawable;)V

    goto :goto_13

    :cond_23
    return-void
.end method

.method public a(F)V
    .registers 3

    .line 24
    iget v0, p0, Lc/a/a/a/h0/g;->s:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_b

    .line 25
    iput p1, p0, Lc/a/a/a/h0/g;->s:F

    .line 26
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_b
    return-void
.end method

.method public final a(Landroid/animation/ValueAnimator;)V
    .registers 3

    .line 20
    iget-object v0, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_13

    .line 21
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot set hideAnimator while the current hideAnimator is running."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 22
    :cond_13
    :goto_13
    iput-object p1, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    .line 23
    new-instance v0, Lc/a/a/a/h0/g$b;

    invoke-direct {v0, p0}, Lc/a/a/a/h0/g$b;-><init>(Lc/a/a/a/h0/g;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public a(Lb/t/a/a/b$a;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    if-nez v0, :cond_b

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    .line 5
    :cond_b
    iget-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 6
    iget-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_18
    return-void
.end method

.method public final varargs a([Landroid/animation/ValueAnimator;)V
    .registers 6

    .line 15
    iget-boolean v0, p0, Lc/a/a/a/h0/g;->r:Z

    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lc/a/a/a/h0/g;->r:Z

    .line 17
    array-length v1, p1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_11

    aget-object v3, p1, v2

    .line 18
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->end()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 19
    :cond_11
    iput-boolean v0, p0, Lc/a/a/a/h0/g;->r:Z

    return-void
.end method

.method public a(ZZZ)Z
    .registers 6

    .line 12
    iget-object v0, p0, Lc/a/a/a/h0/g;->j:Lc/a/a/a/h0/a;

    iget-object v1, p0, Lc/a/a/a/h0/g;->h:Landroid/content/Context;

    .line 13
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/h0/a;->a(Landroid/content/ContentResolver;)F

    move-result v0

    if-eqz p3, :cond_15

    const/4 p3, 0x0

    cmpl-float p3, v0, p3

    if-lez p3, :cond_15

    const/4 p3, 0x1

    goto :goto_16

    :cond_15
    const/4 p3, 0x0

    .line 14
    :goto_16
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/h0/g;->b(ZZZ)Z

    move-result p1

    return p1
.end method

.method public final b()V
    .registers 3

    .line 6
    iget-object v0, p0, Lc/a/a/a/h0/g;->q:Lb/t/a/a/b$a;

    if-eqz v0, :cond_7

    .line 7
    invoke-virtual {v0, p0}, Lb/t/a/a/b$a;->b(Landroid/graphics/drawable/Drawable;)V

    .line 8
    :cond_7
    iget-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    if-eqz v0, :cond_23

    iget-boolean v1, p0, Lc/a/a/a/h0/g;->r:Z

    if-nez v1, :cond_23

    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/t/a/a/b$a;

    .line 10
    invoke-virtual {v1, p0}, Lb/t/a/a/b$a;->b(Landroid/graphics/drawable/Drawable;)V

    goto :goto_13

    :cond_23
    return-void
.end method

.method public final b(Landroid/animation/ValueAnimator;)V
    .registers 3

    .line 26
    iget-object v0, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_13

    .line 27
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot set showAnimator while the current showAnimator is running."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_13
    :goto_13
    iput-object p1, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    .line 29
    new-instance v0, Lc/a/a/a/h0/g$a;

    invoke-direct {v0, p0}, Lc/a/a/a/h0/g$a;-><init>(Lc/a/a/a/h0/g;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public b(Lb/t/a/a/b$a;)Z
    .registers 3

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    if-eqz v0, :cond_1c

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 3
    iget-object v0, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    iget-object p1, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1a

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lc/a/a/a/h0/g;->p:Ljava/util/List;

    :cond_1a
    const/4 p1, 0x1

    return p1

    :cond_1c
    const/4 p1, 0x0

    return p1
.end method

.method public b(ZZZ)Z
    .registers 7

    .line 11
    invoke-virtual {p0}, Lc/a/a/a/h0/g;->g()V

    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    if-nez p1, :cond_d

    return v1

    :cond_d
    if-eqz p1, :cond_12

    .line 13
    iget-object v0, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    goto :goto_14

    :cond_12
    iget-object v0, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    :goto_14
    const/4 v2, 0x1

    if-nez p3, :cond_2d

    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p2

    if-eqz p2, :cond_21

    .line 15
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    goto :goto_28

    :cond_21
    new-array p2, v2, [Landroid/animation/ValueAnimator;

    aput-object v0, p2, v1

    .line 16
    invoke-virtual {p0, p2}, Lc/a/a/a/h0/g;->a([Landroid/animation/ValueAnimator;)V

    .line 17
    :goto_28
    invoke-super {p0, p1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    return p1

    :cond_2d
    if-eqz p3, :cond_36

    .line 18
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p3

    if-eqz p3, :cond_36

    return v1

    :cond_36
    if-eqz p1, :cond_41

    .line 19
    invoke-super {p0, p1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p3

    if-eqz p3, :cond_3f

    goto :goto_41

    :cond_3f
    const/4 p3, 0x0

    goto :goto_42

    :cond_41
    :goto_41
    const/4 p3, 0x1

    :goto_42
    if-eqz p1, :cond_4b

    .line 20
    iget-object p1, p0, Lc/a/a/a/h0/g;->i:Lc/a/a/a/h0/c;

    .line 21
    invoke-virtual {p1}, Lc/a/a/a/h0/c;->b()Z

    move-result p1

    goto :goto_51

    :cond_4b
    iget-object p1, p0, Lc/a/a/a/h0/g;->i:Lc/a/a/a/h0/c;

    invoke-virtual {p1}, Lc/a/a/a/h0/c;->a()Z

    move-result p1

    :goto_51
    if-nez p1, :cond_5b

    new-array p1, v2, [Landroid/animation/ValueAnimator;

    aput-object v0, p1, v1

    .line 22
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/g;->a([Landroid/animation/ValueAnimator;)V

    return p3

    :cond_5b
    if-nez p2, :cond_6e

    .line 23
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x13

    if-lt p1, p2, :cond_6e

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isPaused()Z

    move-result p1

    if-nez p1, :cond_6a

    goto :goto_6e

    .line 24
    :cond_6a
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->resume()V

    goto :goto_71

    .line 25
    :cond_6e
    :goto_6e
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_71
    return p3
.end method

.method public c()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/g;->i:Lc/a/a/a/h0/c;

    invoke-virtual {v0}, Lc/a/a/a/h0/c;->b()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object v0, p0, Lc/a/a/a/h0/g;->i:Lc/a/a/a/h0/c;

    invoke-virtual {v0}, Lc/a/a/a/h0/c;->a()Z

    move-result v0

    if-nez v0, :cond_13

    const/high16 v0, 0x3f800000    # 1.0f

    return v0

    .line 2
    :cond_13
    iget-boolean v0, p0, Lc/a/a/a/h0/g;->n:Z

    if-nez v0, :cond_1f

    iget-boolean v0, p0, Lc/a/a/a/h0/g;->m:Z

    if-eqz v0, :cond_1c

    goto :goto_1f

    .line 3
    :cond_1c
    iget v0, p0, Lc/a/a/a/h0/g;->s:F

    return v0

    .line 4
    :cond_1f
    :goto_1f
    iget v0, p0, Lc/a/a/a/h0/g;->o:F

    return v0
.end method

.method public d()Z
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0, v0, v0}, Lc/a/a/a/h0/g;->a(ZZZ)Z

    move-result v0

    return v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_e

    :cond_a
    iget-boolean v0, p0, Lc/a/a/a/h0/g;->n:Z

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public f()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_e

    :cond_a
    iget-boolean v0, p0, Lc/a/a/a/h0/g;->m:Z

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public final g()V
    .registers 6

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x1f4

    const/4 v3, 0x2

    if-nez v0, :cond_23

    .line 2
    sget-object v0, Lc/a/a/a/h0/g;->v:Landroid/util/Property;

    new-array v4, v3, [F

    fill-array-data v4, :array_44

    invoke-static {p0, v0, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    .line 3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    sget-object v4, Lc/a/a/a/m/a;->b:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/h0/g;->k:Landroid/animation/ValueAnimator;

    invoke-virtual {p0, v0}, Lc/a/a/a/h0/g;->b(Landroid/animation/ValueAnimator;)V

    .line 6
    :cond_23
    iget-object v0, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_43

    .line 7
    sget-object v0, Lc/a/a/a/h0/g;->v:Landroid/util/Property;

    new-array v3, v3, [F

    fill-array-data v3, :array_4c

    invoke-static {p0, v0, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 9
    iget-object v0, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    sget-object v1, Lc/a/a/a/m/a;->b:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 10
    iget-object v0, p0, Lc/a/a/a/h0/g;->l:Landroid/animation/ValueAnimator;

    invoke-virtual {p0, v0}, Lc/a/a/a/h0/g;->a(Landroid/animation/ValueAnimator;)V

    :cond_43
    return-void

    :array_44
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_4c
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getAlpha()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/h0/g;->u:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/g;->f()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0}, Lc/a/a/a/h0/g;->e()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method

.method public setAlpha(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/h0/g;->u:I

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/g;->t:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 4

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, p2, v0}, Lc/a/a/a/h0/g;->a(ZZZ)Z

    move-result p1

    return p1
.end method

.method public start()V
    .registers 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1
    invoke-virtual {p0, v0, v0, v1}, Lc/a/a/a/h0/g;->b(ZZZ)Z

    return-void
.end method

.method public stop()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 1
    invoke-virtual {p0, v0, v1, v0}, Lc/a/a/a/h0/g;->b(ZZZ)Z

    return-void
.end method
