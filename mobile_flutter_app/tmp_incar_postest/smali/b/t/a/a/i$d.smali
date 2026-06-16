.class public Lb/t/a/a/i$d;
.super Lb/t/a/a/i$e;
.source "VectorDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/t/a/a/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final a:Landroid/graphics/Matrix;

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/t/a/a/i$e;",
            ">;"
        }
    .end annotation
.end field

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public final j:Landroid/graphics/Matrix;

.field public k:I

.field public l:[I

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 4

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, v0}, Lb/t/a/a/i$e;-><init>(Lb/t/a/a/i$a;)V

    .line 40
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lb/t/a/a/i$d;->a:Landroid/graphics/Matrix;

    .line 41
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 42
    iput v1, p0, Lb/t/a/a/i$d;->c:F

    .line 43
    iput v1, p0, Lb/t/a/a/i$d;->d:F

    .line 44
    iput v1, p0, Lb/t/a/a/i$d;->e:F

    const/high16 v2, 0x3f800000    # 1.0f

    .line 45
    iput v2, p0, Lb/t/a/a/i$d;->f:F

    .line 46
    iput v2, p0, Lb/t/a/a/i$d;->g:F

    .line 47
    iput v1, p0, Lb/t/a/a/i$d;->h:F

    .line 48
    iput v1, p0, Lb/t/a/a/i$d;->i:F

    .line 49
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    .line 50
    iput-object v0, p0, Lb/t/a/a/i$d;->m:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lb/t/a/a/i$d;Lb/e/a;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/t/a/a/i$d;",
            "Lb/e/a<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lb/t/a/a/i$e;-><init>(Lb/t/a/a/i$a;)V

    .line 2
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lb/t/a/a/i$d;->a:Landroid/graphics/Matrix;

    .line 3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 4
    iput v1, p0, Lb/t/a/a/i$d;->c:F

    .line 5
    iput v1, p0, Lb/t/a/a/i$d;->d:F

    .line 6
    iput v1, p0, Lb/t/a/a/i$d;->e:F

    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    iput v2, p0, Lb/t/a/a/i$d;->f:F

    .line 8
    iput v2, p0, Lb/t/a/a/i$d;->g:F

    .line 9
    iput v1, p0, Lb/t/a/a/i$d;->h:F

    .line 10
    iput v1, p0, Lb/t/a/a/i$d;->i:F

    .line 11
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    .line 12
    iput-object v0, p0, Lb/t/a/a/i$d;->m:Ljava/lang/String;

    .line 13
    iget v0, p1, Lb/t/a/a/i$d;->c:F

    iput v0, p0, Lb/t/a/a/i$d;->c:F

    .line 14
    iget v0, p1, Lb/t/a/a/i$d;->d:F

    iput v0, p0, Lb/t/a/a/i$d;->d:F

    .line 15
    iget v0, p1, Lb/t/a/a/i$d;->e:F

    iput v0, p0, Lb/t/a/a/i$d;->e:F

    .line 16
    iget v0, p1, Lb/t/a/a/i$d;->f:F

    iput v0, p0, Lb/t/a/a/i$d;->f:F

    .line 17
    iget v0, p1, Lb/t/a/a/i$d;->g:F

    iput v0, p0, Lb/t/a/a/i$d;->g:F

    .line 18
    iget v0, p1, Lb/t/a/a/i$d;->h:F

    iput v0, p0, Lb/t/a/a/i$d;->h:F

    .line 19
    iget v0, p1, Lb/t/a/a/i$d;->i:F

    iput v0, p0, Lb/t/a/a/i$d;->i:F

    .line 20
    iget-object v0, p1, Lb/t/a/a/i$d;->l:[I

    iput-object v0, p0, Lb/t/a/a/i$d;->l:[I

    .line 21
    iget-object v0, p1, Lb/t/a/a/i$d;->m:Ljava/lang/String;

    iput-object v0, p0, Lb/t/a/a/i$d;->m:Ljava/lang/String;

    .line 22
    iget v1, p1, Lb/t/a/a/i$d;->k:I

    iput v1, p0, Lb/t/a/a/i$d;->k:I

    if-eqz v0, :cond_59

    .line 23
    invoke-virtual {p2, v0, p0}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    :cond_59
    iget-object v0, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    iget-object v1, p1, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 25
    iget-object p1, p1, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 26
    :goto_63
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_ac

    .line 27
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 28
    instance-of v2, v1, Lb/t/a/a/i$d;

    if-eqz v2, :cond_7e

    .line 29
    check-cast v1, Lb/t/a/a/i$d;

    .line 30
    iget-object v2, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    new-instance v3, Lb/t/a/a/i$d;

    invoke-direct {v3, v1, p2}, Lb/t/a/a/i$d;-><init>(Lb/t/a/a/i$d;Lb/e/a;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a1

    .line 31
    :cond_7e
    instance-of v2, v1, Lb/t/a/a/i$c;

    if-eqz v2, :cond_8a

    .line 32
    new-instance v2, Lb/t/a/a/i$c;

    check-cast v1, Lb/t/a/a/i$c;

    invoke-direct {v2, v1}, Lb/t/a/a/i$c;-><init>(Lb/t/a/a/i$c;)V

    goto :goto_95

    .line 33
    :cond_8a
    instance-of v2, v1, Lb/t/a/a/i$b;

    if-eqz v2, :cond_a4

    .line 34
    new-instance v2, Lb/t/a/a/i$b;

    check-cast v1, Lb/t/a/a/i$b;

    invoke-direct {v2, v1}, Lb/t/a/a/i$b;-><init>(Lb/t/a/a/i$b;)V

    .line 35
    :goto_95
    iget-object v1, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    iget-object v1, v2, Lb/t/a/a/i$f;->b:Ljava/lang/String;

    if-eqz v1, :cond_a1

    .line 37
    invoke-virtual {p2, v1, v2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a1
    :goto_a1
    add-int/lit8 v0, v0, 0x1

    goto :goto_63

    .line 38
    :cond_a4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Unknown object in the tree!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_ac
    return-void
.end method


# virtual methods
.method public a(Landroid/content/res/Resources;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 6

    .line 1
    sget-object v0, Lb/t/a/a/a;->b:[I

    invoke-static {p1, p3, p2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 2
    invoke-virtual {p0, p1, p4}, Lb/t/a/a/i$d;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 3
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public final a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 6

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lb/t/a/a/i$d;->l:[I

    .line 5
    iget v0, p0, Lb/t/a/a/i$d;->c:F

    const-string v1, "rotation"

    const/4 v2, 0x5

    invoke-static {p1, p2, v1, v2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v0

    iput v0, p0, Lb/t/a/a/i$d;->c:F

    .line 6
    iget v0, p0, Lb/t/a/a/i$d;->d:F

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Lb/t/a/a/i$d;->d:F

    .line 7
    iget v0, p0, Lb/t/a/a/i$d;->e:F

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Lb/t/a/a/i$d;->e:F

    .line 8
    iget v0, p0, Lb/t/a/a/i$d;->f:F

    const-string v1, "scaleX"

    const/4 v2, 0x3

    invoke-static {p1, p2, v1, v2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v0

    iput v0, p0, Lb/t/a/a/i$d;->f:F

    .line 9
    iget v0, p0, Lb/t/a/a/i$d;->g:F

    const-string v1, "scaleY"

    const/4 v2, 0x4

    invoke-static {p1, p2, v1, v2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v0

    iput v0, p0, Lb/t/a/a/i$d;->g:F

    .line 10
    iget v0, p0, Lb/t/a/a/i$d;->h:F

    const-string v1, "translateX"

    const/4 v2, 0x6

    invoke-static {p1, p2, v1, v2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v0

    iput v0, p0, Lb/t/a/a/i$d;->h:F

    .line 11
    iget v0, p0, Lb/t/a/a/i$d;->i:F

    const-string v1, "translateY"

    const/4 v2, 0x7

    invoke-static {p1, p2, v1, v2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p2

    iput p2, p0, Lb/t/a/a/i$d;->i:F

    const/4 p2, 0x0

    .line 12
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_55

    .line 13
    iput-object p1, p0, Lb/t/a/a/i$d;->m:Ljava/lang/String;

    .line 14
    :cond_55
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    return-void
.end method

.method public a()Z
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 15
    :goto_2
    iget-object v2, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1d

    .line 16
    iget-object v2, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/t/a/a/i$e;

    invoke-virtual {v2}, Lb/t/a/a/i$e;->a()Z

    move-result v2

    if-eqz v2, :cond_1a

    const/4 v0, 0x1

    return v0

    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1d
    return v0
.end method

.method public a([I)Z
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 17
    :goto_2
    iget-object v2, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1a

    .line 18
    iget-object v2, p0, Lb/t/a/a/i$d;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/t/a/a/i$e;

    invoke-virtual {v2, p1}, Lb/t/a/a/i$e;->a([I)Z

    move-result v2

    or-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_1a
    return v1
.end method

.method public final b()V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 2
    iget-object v0, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    iget v1, p0, Lb/t/a/a/i$d;->d:F

    neg-float v1, v1

    iget v2, p0, Lb/t/a/a/i$d;->e:F

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 3
    iget-object v0, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    iget v1, p0, Lb/t/a/a/i$d;->f:F

    iget v2, p0, Lb/t/a/a/i$d;->g:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 4
    iget-object v0, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    iget v1, p0, Lb/t/a/a/i$d;->c:F

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 5
    iget-object v0, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    iget v1, p0, Lb/t/a/a/i$d;->h:F

    iget v2, p0, Lb/t/a/a/i$d;->d:F

    add-float/2addr v1, v2

    iget v2, p0, Lb/t/a/a/i$d;->i:F

    iget v3, p0, Lb/t/a/a/i$d;->e:F

    add-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return-void
.end method

.method public getGroupName()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/i$d;->m:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalMatrix()Landroid/graphics/Matrix;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/i$d;->j:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getPivotX()F
    .registers 2

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->d:F

    return v0
.end method

.method public getPivotY()F
    .registers 2

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->e:F

    return v0
.end method

.method public getRotation()F
    .registers 2

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->c:F

    return v0
.end method

.method public getScaleX()F
    .registers 2

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->f:F

    return v0
.end method

.method public getScaleY()F
    .registers 2

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->g:F

    return v0
.end method

.method public getTranslateX()F
    .registers 2

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->h:F

    return v0
.end method

.method public getTranslateY()F
    .registers 2

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->i:F

    return v0
.end method

.method public setPivotX(F)V
    .registers 3

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->d:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lb/t/a/a/i$d;->d:F

    .line 3
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    :cond_b
    return-void
.end method

.method public setPivotY(F)V
    .registers 3

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->e:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lb/t/a/a/i$d;->e:F

    .line 3
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    :cond_b
    return-void
.end method

.method public setRotation(F)V
    .registers 3

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->c:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lb/t/a/a/i$d;->c:F

    .line 3
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    :cond_b
    return-void
.end method

.method public setScaleX(F)V
    .registers 3

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->f:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lb/t/a/a/i$d;->f:F

    .line 3
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    :cond_b
    return-void
.end method

.method public setScaleY(F)V
    .registers 3

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->g:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lb/t/a/a/i$d;->g:F

    .line 3
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    :cond_b
    return-void
.end method

.method public setTranslateX(F)V
    .registers 3

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->h:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lb/t/a/a/i$d;->h:F

    .line 3
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    :cond_b
    return-void
.end method

.method public setTranslateY(F)V
    .registers 3

    .line 1
    iget v0, p0, Lb/t/a/a/i$d;->i:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lb/t/a/a/i$d;->i:F

    .line 3
    invoke-virtual {p0}, Lb/t/a/a/i$d;->b()V

    :cond_b
    return-void
.end method
