.class public Lb/f/a/b/k;
.super Lb/f/a/b/c;
.source "KeyTimeCycle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/k$a;
    }
.end annotation


# instance fields
.field public f:Ljava/lang/String;

.field public g:I

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:F

.field public r:F

.field public s:F

.field public t:I

.field public u:F

.field public v:F


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Lb/f/a/b/c;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/a/b/k;->g:I

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 3
    iput v0, p0, Lb/f/a/b/k;->h:F

    .line 4
    iput v0, p0, Lb/f/a/b/k;->i:F

    .line 5
    iput v0, p0, Lb/f/a/b/k;->j:F

    .line 6
    iput v0, p0, Lb/f/a/b/k;->k:F

    .line 7
    iput v0, p0, Lb/f/a/b/k;->l:F

    .line 8
    iput v0, p0, Lb/f/a/b/k;->m:F

    .line 9
    iput v0, p0, Lb/f/a/b/k;->n:F

    .line 10
    iput v0, p0, Lb/f/a/b/k;->o:F

    .line 11
    iput v0, p0, Lb/f/a/b/k;->p:F

    .line 12
    iput v0, p0, Lb/f/a/b/k;->q:F

    .line 13
    iput v0, p0, Lb/f/a/b/k;->r:F

    .line 14
    iput v0, p0, Lb/f/a/b/k;->s:F

    const/4 v1, 0x0

    .line 15
    iput v1, p0, Lb/f/a/b/k;->t:I

    .line 16
    iput v0, p0, Lb/f/a/b/k;->u:F

    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lb/f/a/b/k;->v:F

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic a(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->h:F

    return p0
.end method

.method public static synthetic a(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->h:F

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/k;I)I
    .registers 2

    .line 4
    iput p1, p0, Lb/f/a/b/k;->g:I

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/k;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 3
    iput-object p1, p0, Lb/f/a/b/k;->f:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic b(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->i:F

    return p0
.end method

.method public static synthetic b(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->i:F

    return p1
.end method

.method public static synthetic b(Lb/f/a/b/k;I)I
    .registers 2

    .line 3
    iput p1, p0, Lb/f/a/b/k;->t:I

    return p1
.end method

.method public static synthetic c(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->o:F

    return p0
.end method

.method public static synthetic c(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->o:F

    return p1
.end method

.method public static synthetic d(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->m:F

    return p0
.end method

.method public static synthetic d(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->m:F

    return p1
.end method

.method public static synthetic e(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->p:F

    return p0
.end method

.method public static synthetic e(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->p:F

    return p1
.end method

.method public static synthetic f(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->q:F

    return p0
.end method

.method public static synthetic f(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->q:F

    return p1
.end method

.method public static synthetic g(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->r:F

    return p0
.end method

.method public static synthetic g(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->r:F

    return p1
.end method

.method public static synthetic h(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->s:F

    return p0
.end method

.method public static synthetic h(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->s:F

    return p1
.end method

.method public static synthetic i(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->j:F

    return p0
.end method

.method public static synthetic i(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->j:F

    return p1
.end method

.method public static synthetic j(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->u:F

    return p1
.end method

.method public static synthetic j(Lb/f/a/b/k;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->g:I

    return p0
.end method

.method public static synthetic k(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->v:F

    return p1
.end method

.method public static synthetic k(Lb/f/a/b/k;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->t:I

    return p0
.end method

.method public static synthetic l(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->u:F

    return p0
.end method

.method public static synthetic l(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->n:F

    return p1
.end method

.method public static synthetic m(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->v:F

    return p0
.end method

.method public static synthetic m(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->k:F

    return p1
.end method

.method public static synthetic n(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->n:F

    return p0
.end method

.method public static synthetic n(Lb/f/a/b/k;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/k;->l:F

    return p1
.end method

.method public static synthetic o(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->k:F

    return p0
.end method

.method public static synthetic p(Lb/f/a/b/k;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/k;->l:F

    return p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 5
    sget-object v0, Lb/f/c/f;->KeyTimeCycle:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    invoke-static {p0, p1}, Lb/f/a/b/k$a;->a(Lb/f/a/b/k;Landroid/content/res/TypedArray;)V

    return-void
.end method

.method public a(Ljava/util/HashMap;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/r;",
            ">;)V"
        }
    .end annotation

    .line 34
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, " KeyTimeCycles do not support SplineSet"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ljava/util/HashSet;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 7
    iget v0, p0, Lb/f/a/b/k;->h:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "alpha"

    .line 8
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 9
    :cond_d
    iget v0, p0, Lb/f/a/b/k;->i:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "elevation"

    .line 10
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 11
    :cond_1a
    iget v0, p0, Lb/f/a/b/k;->j:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_27

    const-string v0, "rotation"

    .line 12
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 13
    :cond_27
    iget v0, p0, Lb/f/a/b/k;->k:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_34

    const-string v0, "rotationX"

    .line 14
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 15
    :cond_34
    iget v0, p0, Lb/f/a/b/k;->l:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_41

    const-string v0, "rotationY"

    .line 16
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 17
    :cond_41
    iget v0, p0, Lb/f/a/b/k;->p:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_4e

    const-string v0, "translationX"

    .line 18
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 19
    :cond_4e
    iget v0, p0, Lb/f/a/b/k;->q:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_5b

    const-string v0, "translationY"

    .line 20
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 21
    :cond_5b
    iget v0, p0, Lb/f/a/b/k;->r:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_68

    const-string v0, "translationZ"

    .line 22
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 23
    :cond_68
    iget v0, p0, Lb/f/a/b/k;->m:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_75

    const-string v0, "transitionPathRotate"

    .line 24
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_75
    iget v0, p0, Lb/f/a/b/k;->n:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_82

    const-string v0, "scaleX"

    .line 26
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    :cond_82
    iget v0, p0, Lb/f/a/b/k;->o:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_8f

    const-string v0, "scaleY"

    .line 28
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 29
    :cond_8f
    iget v0, p0, Lb/f/a/b/k;->s:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_9c

    const-string v0, "progress"

    .line 30
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 31
    :cond_9c
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_cf

    .line 32
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_ae
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_cf

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CUSTOM,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_ae

    :cond_cf
    return-void
.end method

.method public b(Ljava/util/HashMap;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 4
    iget v0, p0, Lb/f/a/b/k;->g:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    return-void

    .line 5
    :cond_6
    iget v0, p0, Lb/f/a/b/k;->h:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_19

    .line 6
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "alpha"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    :cond_19
    iget v0, p0, Lb/f/a/b/k;->i:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 8
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "elevation"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    :cond_2c
    iget v0, p0, Lb/f/a/b/k;->j:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_3f

    .line 10
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "rotation"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    :cond_3f
    iget v0, p0, Lb/f/a/b/k;->k:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_52

    .line 12
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "rotationX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    :cond_52
    iget v0, p0, Lb/f/a/b/k;->l:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_65

    .line 14
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "rotationY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    :cond_65
    iget v0, p0, Lb/f/a/b/k;->p:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_78

    .line 16
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "translationX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    :cond_78
    iget v0, p0, Lb/f/a/b/k;->q:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_8b

    .line 18
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "translationY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    :cond_8b
    iget v0, p0, Lb/f/a/b/k;->r:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_9e

    .line 20
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "translationZ"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    :cond_9e
    iget v0, p0, Lb/f/a/b/k;->m:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_b1

    .line 22
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "transitionPathRotate"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    :cond_b1
    iget v0, p0, Lb/f/a/b/k;->n:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_c4

    .line 24
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "scaleX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    :cond_c4
    iget v0, p0, Lb/f/a/b/k;->n:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_d7

    .line 26
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "scaleY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    :cond_d7
    iget v0, p0, Lb/f/a/b/k;->s:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_ea

    .line 28
    iget v0, p0, Lb/f/a/b/k;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "progress"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    :cond_ea
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_123

    .line 30
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_fc
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_123

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CUSTOM,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lb/f/a/b/k;->g:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_fc

    :cond_123
    return-void
.end method

.method public c(Ljava/util/HashMap;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/s;",
            ">;)V"
        }
    .end annotation

    .line 3
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1fe

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 4
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lb/f/a/b/s;

    const-string v2, "CUSTOM"

    .line 5
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x7

    if-eqz v2, :cond_42

    .line 6
    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 7
    iget-object v2, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lb/f/c/a;

    if-eqz v6, :cond_8

    .line 8
    move-object v4, v3

    check-cast v4, Lb/f/a/b/s$b;

    iget v5, p0, Lb/f/a/b/c;->a:I

    iget v7, p0, Lb/f/a/b/k;->u:F

    iget v8, p0, Lb/f/a/b/k;->t:I

    iget v9, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v4 .. v9}, Lb/f/a/b/s$b;->a(ILb/f/c/a;FIF)V

    goto :goto_8

    :cond_42
    const/4 v2, -0x1

    .line 9
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_200

    goto/16 :goto_c9

    :sswitch_4c
    const-string v4, "alpha"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/4 v4, 0x0

    goto/16 :goto_ca

    :sswitch_57
    const-string v4, "transitionPathRotate"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/4 v4, 0x5

    goto/16 :goto_ca

    :sswitch_62
    const-string v4, "elevation"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/4 v4, 0x1

    goto :goto_ca

    :sswitch_6c
    const-string v4, "rotation"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/4 v4, 0x2

    goto :goto_ca

    :sswitch_76
    const-string v5, "scaleY"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c9

    goto :goto_ca

    :sswitch_7f
    const-string v4, "scaleX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/4 v4, 0x6

    goto :goto_ca

    :sswitch_89
    const-string v4, "progress"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/16 v4, 0xb

    goto :goto_ca

    :sswitch_94
    const-string v4, "translationZ"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/16 v4, 0xa

    goto :goto_ca

    :sswitch_9f
    const-string v4, "translationY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/16 v4, 0x9

    goto :goto_ca

    :sswitch_aa
    const-string v4, "translationX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/16 v4, 0x8

    goto :goto_ca

    :sswitch_b5
    const-string v4, "rotationY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/4 v4, 0x4

    goto :goto_ca

    :sswitch_bf
    const-string v4, "rotationX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    const/4 v4, 0x3

    goto :goto_ca

    :cond_c9
    :goto_c9
    const/4 v4, -0x1

    :goto_ca
    packed-switch v4, :pswitch_data_232

    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UNKNOWN addValues \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "KeyTimeCycles"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 11
    :pswitch_ea
    iget v1, p0, Lb/f/a/b/k;->s:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 12
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->s:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 13
    :pswitch_101
    iget v1, p0, Lb/f/a/b/k;->r:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 14
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->r:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 15
    :pswitch_118
    iget v1, p0, Lb/f/a/b/k;->q:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 16
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->q:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 17
    :pswitch_12f
    iget v1, p0, Lb/f/a/b/k;->p:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 18
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->p:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 19
    :pswitch_146
    iget v1, p0, Lb/f/a/b/k;->o:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 20
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->o:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 21
    :pswitch_15d
    iget v1, p0, Lb/f/a/b/k;->n:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 22
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->n:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 23
    :pswitch_174
    iget v1, p0, Lb/f/a/b/k;->m:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 24
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->m:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 25
    :pswitch_18b
    iget v1, p0, Lb/f/a/b/k;->l:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 26
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->l:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 27
    :pswitch_1a2
    iget v1, p0, Lb/f/a/b/k;->k:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 28
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->k:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 29
    :pswitch_1b9
    iget v1, p0, Lb/f/a/b/k;->j:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 30
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->j:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 31
    :pswitch_1d0
    iget v1, p0, Lb/f/a/b/k;->i:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 32
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->i:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    .line 33
    :pswitch_1e7
    iget v1, p0, Lb/f/a/b/k;->h:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 34
    iget v4, p0, Lb/f/a/b/c;->a:I

    iget v5, p0, Lb/f/a/b/k;->h:F

    iget v6, p0, Lb/f/a/b/k;->u:F

    iget v7, p0, Lb/f/a/b/k;->t:I

    iget v8, p0, Lb/f/a/b/k;->v:F

    invoke-virtual/range {v3 .. v8}, Lb/f/a/b/s;->a(IFFIF)V

    goto/16 :goto_8

    :cond_1fe
    return-void

    nop

    :sswitch_data_200
    .sparse-switch
        -0x4a771f66 -> :sswitch_bf
        -0x4a771f65 -> :sswitch_b5
        -0x490b9c39 -> :sswitch_aa
        -0x490b9c38 -> :sswitch_9f
        -0x490b9c37 -> :sswitch_94
        -0x3bab3dd3 -> :sswitch_89
        -0x3621dfb2 -> :sswitch_7f
        -0x3621dfb1 -> :sswitch_76
        -0x266f082 -> :sswitch_6c
        -0x42d1a3 -> :sswitch_62
        0x2382115 -> :sswitch_57
        0x589b15e -> :sswitch_4c
    .end sparse-switch

    :pswitch_data_232
    .packed-switch 0x0
        :pswitch_1e7
        :pswitch_1d0
        :pswitch_1b9
        :pswitch_1a2
        :pswitch_18b
        :pswitch_174
        :pswitch_15d
        :pswitch_146
        :pswitch_12f
        :pswitch_118
        :pswitch_101
        :pswitch_ea
    .end packed-switch
.end method
