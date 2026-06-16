.class public Lc/a/a/a/m/h;
.super Ljava/lang/Object;
.source "MotionSpec.java"


# instance fields
.field public final a:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Ljava/lang/String;",
            "Lc/a/a/a/m/i;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Ljava/lang/String;",
            "[",
            "Landroid/animation/PropertyValuesHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    iput-object v0, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    .line 3
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    iput-object v0, p0, Lc/a/a/a/m/h;->b:Lb/e/g;

    return-void
.end method

.method public static a(Landroid/content/Context;I)Lc/a/a/a/m/h;
    .registers 5

    const/4 v0, 0x0

    .line 18
    :try_start_1
    invoke-static {p0, p1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p0

    .line 19
    instance-of v1, p0, Landroid/animation/AnimatorSet;

    if-eqz v1, :cond_14

    .line 20
    check-cast p0, Landroid/animation/AnimatorSet;

    .line 21
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lc/a/a/a/m/h;->a(Ljava/util/List;)Lc/a/a/a/m/h;

    move-result-object p0

    return-object p0

    :cond_14
    if-eqz p0, :cond_23

    .line 22
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    invoke-static {v1}, Lc/a/a/a/m/h;->a(Ljava/util/List;)Lc/a/a/a/m/h;

    move-result-object p0
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_22} :catch_24

    return-object p0

    :cond_23
    return-object v0

    :catch_24
    move-exception p0

    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t load animation resource ID #0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "MotionSpec"

    invoke-static {v1, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;
    .registers 4

    .line 15
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    if-eqz p1, :cond_12

    .line 17
    invoke-static {p0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p0

    return-object p0

    :cond_12
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Ljava/util/List;)Lc/a/a/a/m/h;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)",
            "Lc/a/a/a/m/h;"
        }
    .end annotation

    .line 26
    new-instance v0, Lc/a/a/a/m/h;

    invoke-direct {v0}, Lc/a/a/a/m/h;-><init>()V

    .line 27
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v1, :cond_18

    .line 28
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator;

    invoke-static {v0, v3}, Lc/a/a/a/m/h;->a(Lc/a/a/a/m/h;Landroid/animation/Animator;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_18
    return-object v0
.end method

.method public static a(Lc/a/a/a/m/h;Landroid/animation/Animator;)V
    .registers 4

    .line 29
    instance-of v0, p1, Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1d

    .line 30
    check-cast p1, Landroid/animation/ObjectAnimator;

    .line 31
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->getValues()[Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lc/a/a/a/m/h;->a(Ljava/lang/String;[Landroid/animation/PropertyValuesHolder;)V

    .line 32
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lc/a/a/a/m/i;->a(Landroid/animation/ValueAnimator;)Lc/a/a/a/m/i;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Lc/a/a/a/m/i;)V

    return-void

    .line 33
    :cond_1d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Animator must be an ObjectAnimator: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public a()J
    .registers 10

    .line 12
    iget-object v0, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v0}, Lb/e/g;->size()I

    move-result v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    :goto_9
    if-ge v3, v0, :cond_23

    .line 13
    iget-object v4, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v4, v3}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc/a/a/a/m/i;

    .line 14
    invoke-virtual {v4}, Lc/a/a/a/m/i;->a()J

    move-result-wide v5

    invoke-virtual {v4}, Lc/a/a/a/m/i;->b()J

    move-result-wide v7

    add-long/2addr v5, v7

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_23
    return-wide v1
.end method

.method public a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Landroid/util/Property<",
            "TT;*>;)",
            "Landroid/animation/ObjectAnimator;"
        }
    .end annotation

    .line 9
    invoke-virtual {p0, p1}, Lc/a/a/a/m/h;->a(Ljava/lang/String;)[Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p2

    .line 10
    invoke-virtual {p2, p3}, Landroid/animation/ObjectAnimator;->setProperty(Landroid/util/Property;)V

    .line 11
    invoke-virtual {p0, p1}, Lc/a/a/a/m/h;->b(Ljava/lang/String;)Lc/a/a/a/m/i;

    move-result-object p1

    invoke-virtual {p1, p2}, Lc/a/a/a/m/i;->a(Landroid/animation/Animator;)V

    return-object p2
.end method

.method public a(Ljava/lang/String;Lc/a/a/a/m/i;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v0, p1, p2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public a(Ljava/lang/String;[Landroid/animation/PropertyValuesHolder;)V
    .registers 4

    .line 5
    iget-object v0, p0, Lc/a/a/a/m/h;->b:Lb/e/g;

    invoke-virtual {v0, p1, p2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public a(Ljava/lang/String;)[Landroid/animation/PropertyValuesHolder;
    .registers 3

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 3
    iget-object v0, p0, Lc/a/a/a/m/h;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/animation/PropertyValuesHolder;

    invoke-virtual {p0, p1}, Lc/a/a/a/m/h;->a([Landroid/animation/PropertyValuesHolder;)[Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    return-object p1

    .line 4
    :cond_13
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public final a([Landroid/animation/PropertyValuesHolder;)[Landroid/animation/PropertyValuesHolder;
    .registers 5

    .line 6
    array-length v0, p1

    new-array v0, v0, [Landroid/animation/PropertyValuesHolder;

    const/4 v1, 0x0

    .line 7
    :goto_4
    array-length v2, p1

    if-ge v1, v2, :cond_12

    .line 8
    aget-object v2, p1, v1

    invoke-virtual {v2}, Landroid/animation/PropertyValuesHolder;->clone()Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_12
    return-object v0
.end method

.method public b(Ljava/lang/String;)Lc/a/a/a/m/i;
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/m/h;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    iget-object v0, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc/a/a/a/m/i;

    return-object p1

    .line 3
    :cond_f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public c(Ljava/lang/String;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/m/h;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    return p1
.end method

.method public d(Ljava/lang/String;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    if-ne p0, p1, :cond_4

    const/4 p1, 0x1

    return p1

    .line 1
    :cond_4
    instance-of v0, p1, Lc/a/a/a/m/h;

    if-nez v0, :cond_a

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_a
    check-cast p1, Lc/a/a/a/m/h;

    .line 3
    iget-object v0, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    iget-object p1, p1, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v0}, Lb/e/g;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0xa

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3
    const-class v1, Lc/a/a/a/m/h;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7b

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " timings: "

    .line 6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    iget-object v1, p0, Lc/a/a/a/m/h;->a:Lb/e/g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}\n"

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
