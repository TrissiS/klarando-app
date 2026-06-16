.class public Lb/f/a/b/d;
.super Lb/f/a/b/c;
.source "KeyAttributes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/d$a;
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

.field public t:F

.field public u:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/f/a/b/c;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/a/b/d;->g:I

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 3
    iput v0, p0, Lb/f/a/b/d;->h:F

    .line 4
    iput v0, p0, Lb/f/a/b/d;->i:F

    .line 5
    iput v0, p0, Lb/f/a/b/d;->j:F

    .line 6
    iput v0, p0, Lb/f/a/b/d;->k:F

    .line 7
    iput v0, p0, Lb/f/a/b/d;->l:F

    .line 8
    iput v0, p0, Lb/f/a/b/d;->m:F

    .line 9
    iput v0, p0, Lb/f/a/b/d;->n:F

    .line 10
    iput v0, p0, Lb/f/a/b/d;->o:F

    .line 11
    iput v0, p0, Lb/f/a/b/d;->p:F

    .line 12
    iput v0, p0, Lb/f/a/b/d;->q:F

    .line 13
    iput v0, p0, Lb/f/a/b/d;->r:F

    .line 14
    iput v0, p0, Lb/f/a/b/d;->s:F

    .line 15
    iput v0, p0, Lb/f/a/b/d;->t:F

    .line 16
    iput v0, p0, Lb/f/a/b/d;->u:F

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic a(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->h:F

    return p0
.end method

.method public static synthetic a(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->h:F

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/d;I)I
    .registers 2

    .line 3
    iput p1, p0, Lb/f/a/b/d;->g:I

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/d;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 4
    iput-object p1, p0, Lb/f/a/b/d;->f:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic b(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->i:F

    return p0
.end method

.method public static synthetic b(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->q:F

    return p1
.end method

.method public static synthetic c(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->q:F

    return p0
.end method

.method public static synthetic c(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->i:F

    return p1
.end method

.method public static synthetic d(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->o:F

    return p0
.end method

.method public static synthetic d(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->o:F

    return p1
.end method

.method public static synthetic e(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->r:F

    return p0
.end method

.method public static synthetic e(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->r:F

    return p1
.end method

.method public static synthetic f(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->s:F

    return p0
.end method

.method public static synthetic f(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->s:F

    return p1
.end method

.method public static synthetic g(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->t:F

    return p0
.end method

.method public static synthetic g(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->t:F

    return p1
.end method

.method public static synthetic h(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->u:F

    return p0
.end method

.method public static synthetic h(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->u:F

    return p1
.end method

.method public static synthetic i(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->j:F

    return p0
.end method

.method public static synthetic i(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->j:F

    return p1
.end method

.method public static synthetic j(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->p:F

    return p1
.end method

.method public static synthetic j(Lb/f/a/b/d;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->g:I

    return p0
.end method

.method public static synthetic k(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->p:F

    return p0
.end method

.method public static synthetic k(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->k:F

    return p1
.end method

.method public static synthetic l(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->k:F

    return p0
.end method

.method public static synthetic l(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->l:F

    return p1
.end method

.method public static synthetic m(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->l:F

    return p0
.end method

.method public static synthetic m(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->m:F

    return p1
.end method

.method public static synthetic n(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->m:F

    return p0
.end method

.method public static synthetic n(Lb/f/a/b/d;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/d;->n:F

    return p1
.end method

.method public static synthetic o(Lb/f/a/b/d;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/d;->n:F

    return p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 5
    sget-object v0, Lb/f/c/f;->KeyAttribute:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    invoke-static {p0, p1}, Lb/f/a/b/d$a;->a(Lb/f/a/b/d;Landroid/content/res/TypedArray;)V

    return-void
.end method

.method public a(Ljava/util/HashMap;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/r;",
            ">;)V"
        }
    .end annotation

    .line 38
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1e7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 39
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/r;

    const-string v3, "CUSTOM"

    .line 40
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x7

    if-eqz v3, :cond_39

    .line 41
    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 42
    iget-object v3, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/c/a;

    if-eqz v1, :cond_8

    .line 43
    check-cast v2, Lb/f/a/b/r$b;

    iget v3, p0, Lb/f/a/b/c;->a:I

    invoke-virtual {v2, v3, v1}, Lb/f/a/b/r$b;->a(ILb/f/c/a;)V

    goto :goto_8

    :cond_39
    const/4 v3, -0x1

    .line 44
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_1e8

    goto/16 :goto_d8

    :sswitch_43
    const-string v4, "alpha"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/4 v4, 0x0

    goto/16 :goto_d9

    :sswitch_4e
    const-string v5, "transitionPathRotate"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d8

    goto/16 :goto_d9

    :sswitch_58
    const-string v4, "elevation"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/4 v4, 0x1

    goto/16 :goto_d9

    :sswitch_63
    const-string v4, "rotation"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/4 v4, 0x2

    goto/16 :goto_d9

    :sswitch_6e
    const-string v4, "transformPivotY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/4 v4, 0x6

    goto :goto_d9

    :sswitch_78
    const-string v4, "transformPivotX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/4 v4, 0x5

    goto :goto_d9

    :sswitch_82
    const-string v4, "scaleY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/16 v4, 0x9

    goto :goto_d9

    :sswitch_8d
    const-string v4, "scaleX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/16 v4, 0x8

    goto :goto_d9

    :sswitch_98
    const-string v4, "progress"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/16 v4, 0xd

    goto :goto_d9

    :sswitch_a3
    const-string v4, "translationZ"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/16 v4, 0xc

    goto :goto_d9

    :sswitch_ae
    const-string v4, "translationY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/16 v4, 0xb

    goto :goto_d9

    :sswitch_b9
    const-string v4, "translationX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/16 v4, 0xa

    goto :goto_d9

    :sswitch_c4
    const-string v4, "rotationY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/4 v4, 0x4

    goto :goto_d9

    :sswitch_ce
    const-string v4, "rotationX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d8

    const/4 v4, 0x3

    goto :goto_d9

    :cond_d8
    :goto_d8
    const/4 v4, -0x1

    :goto_d9
    packed-switch v4, :pswitch_data_222

    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UNKNOWN addValues \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "KeyAttributes"

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 46
    :pswitch_f9
    iget v1, p0, Lb/f/a/b/d;->u:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 47
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->u:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 48
    :pswitch_10a
    iget v1, p0, Lb/f/a/b/d;->t:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 49
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->t:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 50
    :pswitch_11b
    iget v1, p0, Lb/f/a/b/d;->s:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 51
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->s:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 52
    :pswitch_12c
    iget v1, p0, Lb/f/a/b/d;->r:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 53
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->r:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 54
    :pswitch_13d
    iget v1, p0, Lb/f/a/b/d;->q:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 55
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->q:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 56
    :pswitch_14e
    iget v1, p0, Lb/f/a/b/d;->p:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 57
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->p:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 58
    :pswitch_15f
    iget v1, p0, Lb/f/a/b/d;->o:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 59
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->o:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 60
    :pswitch_170
    iget v1, p0, Lb/f/a/b/d;->l:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 61
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->n:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 62
    :pswitch_181
    iget v1, p0, Lb/f/a/b/d;->k:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 63
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->m:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 64
    :pswitch_192
    iget v1, p0, Lb/f/a/b/d;->l:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 65
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->l:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 66
    :pswitch_1a3
    iget v1, p0, Lb/f/a/b/d;->k:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 67
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->k:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 68
    :pswitch_1b4
    iget v1, p0, Lb/f/a/b/d;->j:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 69
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->j:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 70
    :pswitch_1c5
    iget v1, p0, Lb/f/a/b/d;->i:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 71
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->i:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 72
    :pswitch_1d6
    iget v1, p0, Lb/f/a/b/d;->h:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_8

    .line 73
    iget v1, p0, Lb/f/a/b/c;->a:I

    iget v3, p0, Lb/f/a/b/d;->h:F

    invoke-virtual {v2, v1, v3}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    :cond_1e7
    return-void

    :sswitch_data_1e8
    .sparse-switch
        -0x4a771f66 -> :sswitch_ce
        -0x4a771f65 -> :sswitch_c4
        -0x490b9c39 -> :sswitch_b9
        -0x490b9c38 -> :sswitch_ae
        -0x490b9c37 -> :sswitch_a3
        -0x3bab3dd3 -> :sswitch_98
        -0x3621dfb2 -> :sswitch_8d
        -0x3621dfb1 -> :sswitch_82
        -0x2d5a2d1e -> :sswitch_78
        -0x2d5a2d1d -> :sswitch_6e
        -0x266f082 -> :sswitch_63
        -0x42d1a3 -> :sswitch_58
        0x2382115 -> :sswitch_4e
        0x589b15e -> :sswitch_43
    .end sparse-switch

    :pswitch_data_222
    .packed-switch 0x0
        :pswitch_1d6
        :pswitch_1c5
        :pswitch_1b4
        :pswitch_1a3
        :pswitch_192
        :pswitch_181
        :pswitch_170
        :pswitch_15f
        :pswitch_14e
        :pswitch_13d
        :pswitch_12c
        :pswitch_11b
        :pswitch_10a
        :pswitch_f9
    .end packed-switch
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
    iget v0, p0, Lb/f/a/b/d;->h:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "alpha"

    .line 8
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 9
    :cond_d
    iget v0, p0, Lb/f/a/b/d;->i:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "elevation"

    .line 10
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 11
    :cond_1a
    iget v0, p0, Lb/f/a/b/d;->j:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_27

    const-string v0, "rotation"

    .line 12
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 13
    :cond_27
    iget v0, p0, Lb/f/a/b/d;->k:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_34

    const-string v0, "rotationX"

    .line 14
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 15
    :cond_34
    iget v0, p0, Lb/f/a/b/d;->l:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_41

    const-string v0, "rotationY"

    .line 16
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 17
    :cond_41
    iget v0, p0, Lb/f/a/b/d;->m:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_4e

    const-string v0, "transformPivotX"

    .line 18
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 19
    :cond_4e
    iget v0, p0, Lb/f/a/b/d;->n:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_5b

    const-string v0, "transformPivotY"

    .line 20
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 21
    :cond_5b
    iget v0, p0, Lb/f/a/b/d;->r:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_68

    const-string v0, "translationX"

    .line 22
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 23
    :cond_68
    iget v0, p0, Lb/f/a/b/d;->s:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_75

    const-string v0, "translationY"

    .line 24
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_75
    iget v0, p0, Lb/f/a/b/d;->t:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_82

    const-string v0, "translationZ"

    .line 26
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    :cond_82
    iget v0, p0, Lb/f/a/b/d;->o:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_8f

    const-string v0, "transitionPathRotate"

    .line 28
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 29
    :cond_8f
    iget v0, p0, Lb/f/a/b/d;->p:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_9c

    const-string v0, "scaleX"

    .line 30
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 31
    :cond_9c
    iget v0, p0, Lb/f/a/b/d;->p:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_a9

    const-string v0, "scaleY"

    .line 32
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 33
    :cond_a9
    iget v0, p0, Lb/f/a/b/d;->u:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_b6

    const-string v0, "progress"

    .line 34
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 35
    :cond_b6
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_e9

    .line 36
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_e9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CUSTOM,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_c8

    :cond_e9
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

    .line 3
    iget v0, p0, Lb/f/a/b/d;->g:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    return-void

    .line 4
    :cond_6
    iget v0, p0, Lb/f/a/b/d;->h:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_19

    .line 5
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "alpha"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    :cond_19
    iget v0, p0, Lb/f/a/b/d;->i:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 7
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "elevation"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    :cond_2c
    iget v0, p0, Lb/f/a/b/d;->j:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_3f

    .line 9
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "rotation"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    :cond_3f
    iget v0, p0, Lb/f/a/b/d;->k:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_52

    .line 11
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "rotationX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    :cond_52
    iget v0, p0, Lb/f/a/b/d;->l:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_65

    .line 13
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "rotationY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    :cond_65
    iget v0, p0, Lb/f/a/b/d;->m:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_78

    .line 15
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "transformPivotX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    :cond_78
    iget v0, p0, Lb/f/a/b/d;->n:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_8b

    .line 17
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "transformPivotY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    :cond_8b
    iget v0, p0, Lb/f/a/b/d;->r:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_9e

    .line 19
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "translationX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    :cond_9e
    iget v0, p0, Lb/f/a/b/d;->s:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_b1

    .line 21
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "translationY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    :cond_b1
    iget v0, p0, Lb/f/a/b/d;->t:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_c4

    .line 23
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "translationZ"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    :cond_c4
    iget v0, p0, Lb/f/a/b/d;->o:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_d7

    .line 25
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "transitionPathRotate"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    :cond_d7
    iget v0, p0, Lb/f/a/b/d;->p:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_ea

    .line 27
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "scaleX"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    :cond_ea
    iget v0, p0, Lb/f/a/b/d;->q:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_fd

    .line 29
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "scaleY"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    :cond_fd
    iget v0, p0, Lb/f/a/b/d;->u:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_110

    .line 31
    iget v0, p0, Lb/f/a/b/d;->g:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "progress"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    :cond_110
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_149

    .line 33
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_122
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_149

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CUSTOM,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lb/f/a/b/d;->g:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_122

    :cond_149
    return-void
.end method
