.class public Lb/f/a/b/f;
.super Lb/f/a/b/c;
.source "KeyCycle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/f$a;
    }
.end annotation


# instance fields
.field public f:Ljava/lang/String;

.field public g:I

.field public h:I

.field public i:F

.field public j:F

.field public k:F

.field public l:I

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:F

.field public r:F

.field public s:F

.field public t:F

.field public u:F

.field public v:F

.field public w:F


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Lb/f/a/b/c;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/f/a/b/f;->g:I

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lb/f/a/b/f;->h:I

    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 4
    iput v1, p0, Lb/f/a/b/f;->i:F

    const/4 v2, 0x0

    .line 5
    iput v2, p0, Lb/f/a/b/f;->j:F

    .line 6
    iput v1, p0, Lb/f/a/b/f;->k:F

    .line 7
    iput v0, p0, Lb/f/a/b/f;->l:I

    .line 8
    iput v1, p0, Lb/f/a/b/f;->m:F

    .line 9
    iput v1, p0, Lb/f/a/b/f;->n:F

    .line 10
    iput v1, p0, Lb/f/a/b/f;->o:F

    .line 11
    iput v1, p0, Lb/f/a/b/f;->p:F

    .line 12
    iput v1, p0, Lb/f/a/b/f;->q:F

    .line 13
    iput v1, p0, Lb/f/a/b/f;->r:F

    .line 14
    iput v1, p0, Lb/f/a/b/f;->s:F

    .line 15
    iput v1, p0, Lb/f/a/b/f;->t:F

    .line 16
    iput v1, p0, Lb/f/a/b/f;->u:F

    .line 17
    iput v1, p0, Lb/f/a/b/f;->v:F

    .line 18
    iput v1, p0, Lb/f/a/b/f;->w:F

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic a(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->q:F

    return p0
.end method

.method public static synthetic a(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->q:F

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/f;I)I
    .registers 2

    .line 4
    iput p1, p0, Lb/f/a/b/f;->g:I

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/f;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 3
    iput-object p1, p0, Lb/f/a/b/f;->f:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic b(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->r:F

    return p0
.end method

.method public static synthetic b(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->r:F

    return p1
.end method

.method public static synthetic b(Lb/f/a/b/f;I)I
    .registers 2

    .line 3
    iput p1, p0, Lb/f/a/b/f;->h:I

    return p1
.end method

.method public static synthetic c(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->p:F

    return p0
.end method

.method public static synthetic c(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->p:F

    return p1
.end method

.method public static synthetic c(Lb/f/a/b/f;I)I
    .registers 2

    .line 3
    iput p1, p0, Lb/f/a/b/f;->l:I

    return p1
.end method

.method public static synthetic d(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->s:F

    return p0
.end method

.method public static synthetic d(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->s:F

    return p1
.end method

.method public static synthetic e(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->t:F

    return p0
.end method

.method public static synthetic e(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->t:F

    return p1
.end method

.method public static synthetic f(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->u:F

    return p0
.end method

.method public static synthetic f(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->u:F

    return p1
.end method

.method public static synthetic g(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->v:F

    return p0
.end method

.method public static synthetic g(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->v:F

    return p1
.end method

.method public static synthetic h(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->w:F

    return p0
.end method

.method public static synthetic h(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->w:F

    return p1
.end method

.method public static synthetic i(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->k:F

    return p0
.end method

.method public static synthetic i(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->k:F

    return p1
.end method

.method public static synthetic j(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->i:F

    return p1
.end method

.method public static synthetic j(Lb/f/a/b/f;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->g:I

    return p0
.end method

.method public static synthetic k(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->j:F

    return p1
.end method

.method public static synthetic k(Lb/f/a/b/f;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->h:I

    return p0
.end method

.method public static synthetic l(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->i:F

    return p0
.end method

.method public static synthetic l(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->m:F

    return p1
.end method

.method public static synthetic m(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->j:F

    return p0
.end method

.method public static synthetic m(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->n:F

    return p1
.end method

.method public static synthetic n(Lb/f/a/b/f;F)F
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/f;->o:F

    return p1
.end method

.method public static synthetic n(Lb/f/a/b/f;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->l:I

    return p0
.end method

.method public static synthetic o(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->m:F

    return p0
.end method

.method public static synthetic p(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->n:F

    return p0
.end method

.method public static synthetic q(Lb/f/a/b/f;)F
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/f;->o:F

    return p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 5
    sget-object v0, Lb/f/c/f;->KeyCycle:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    invoke-static {p0, p1}, Lb/f/a/b/f$a;->a(Lb/f/a/b/f;Landroid/content/res/TypedArray;)V

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

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "add "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " values"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    const-string v2, "KeyCycle"

    invoke-static {v2, v0, v1}, Lb/f/a/b/a;->a(Ljava/lang/String;Ljava/lang/String;I)V

    .line 33
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_28
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 34
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/r;

    const/4 v4, -0x1

    .line 35
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_15e

    goto/16 :goto_cd

    :sswitch_44
    const-string v5, "waveOffset"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/16 v4, 0xb

    goto/16 :goto_cd

    :sswitch_50
    const-string v5, "alpha"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x0

    goto/16 :goto_cd

    :sswitch_5b
    const-string v5, "transitionPathRotate"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x5

    goto/16 :goto_cd

    :sswitch_66
    const-string v5, "elevation"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x1

    goto :goto_cd

    :sswitch_70
    const-string v5, "rotation"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x2

    goto :goto_cd

    :sswitch_7a
    const-string v5, "scaleY"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x7

    goto :goto_cd

    :sswitch_84
    const-string v5, "scaleX"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x6

    goto :goto_cd

    :sswitch_8e
    const-string v5, "progress"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/16 v4, 0xc

    goto :goto_cd

    :sswitch_99
    const-string v5, "translationZ"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/16 v4, 0xa

    goto :goto_cd

    :sswitch_a4
    const-string v5, "translationY"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/16 v4, 0x9

    goto :goto_cd

    :sswitch_af
    const-string v5, "translationX"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/16 v4, 0x8

    goto :goto_cd

    :sswitch_ba
    const-string v5, "rotationY"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x4

    goto :goto_cd

    :sswitch_c4
    const-string v5, "rotationX"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cd

    const/4 v4, 0x3

    :cond_cd
    :goto_cd
    packed-switch v4, :pswitch_data_194

    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  UNKNOWN  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "WARNING KeyCycle"

    invoke-static {v3, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_28

    .line 37
    :pswitch_e8
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->k:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 38
    :pswitch_f1
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->j:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 39
    :pswitch_fa
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->w:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 40
    :pswitch_103
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->v:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 41
    :pswitch_10c
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->u:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 42
    :pswitch_115
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->t:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 43
    :pswitch_11e
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->s:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 44
    :pswitch_127
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->p:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 45
    :pswitch_130
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->r:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 46
    :pswitch_139
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->q:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 47
    :pswitch_142
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->o:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 48
    :pswitch_14b
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->n:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    .line 49
    :pswitch_154
    iget v2, p0, Lb/f/a/b/c;->a:I

    iget v4, p0, Lb/f/a/b/f;->m:F

    invoke-virtual {v3, v2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_28

    :cond_15d
    return-void

    :sswitch_data_15e
    .sparse-switch
        -0x4a771f66 -> :sswitch_c4
        -0x4a771f65 -> :sswitch_ba
        -0x490b9c39 -> :sswitch_af
        -0x490b9c38 -> :sswitch_a4
        -0x490b9c37 -> :sswitch_99
        -0x3bab3dd3 -> :sswitch_8e
        -0x3621dfb2 -> :sswitch_84
        -0x3621dfb1 -> :sswitch_7a
        -0x266f082 -> :sswitch_70
        -0x42d1a3 -> :sswitch_66
        0x2382115 -> :sswitch_5b
        0x589b15e -> :sswitch_50
        0x94e04ec -> :sswitch_44
    .end sparse-switch

    :pswitch_data_194
    .packed-switch 0x0
        :pswitch_154
        :pswitch_14b
        :pswitch_142
        :pswitch_139
        :pswitch_130
        :pswitch_127
        :pswitch_11e
        :pswitch_115
        :pswitch_10c
        :pswitch_103
        :pswitch_fa
        :pswitch_f1
        :pswitch_e8
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
    iget v0, p0, Lb/f/a/b/f;->m:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "alpha"

    .line 8
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 9
    :cond_d
    iget v0, p0, Lb/f/a/b/f;->n:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "elevation"

    .line 10
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 11
    :cond_1a
    iget v0, p0, Lb/f/a/b/f;->o:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_27

    const-string v0, "rotation"

    .line 12
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 13
    :cond_27
    iget v0, p0, Lb/f/a/b/f;->q:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_34

    const-string v0, "rotationX"

    .line 14
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 15
    :cond_34
    iget v0, p0, Lb/f/a/b/f;->r:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_41

    const-string v0, "rotationY"

    .line 16
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 17
    :cond_41
    iget v0, p0, Lb/f/a/b/f;->s:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_4e

    const-string v0, "scaleX"

    .line 18
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 19
    :cond_4e
    iget v0, p0, Lb/f/a/b/f;->t:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_5b

    const-string v0, "scaleY"

    .line 20
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 21
    :cond_5b
    iget v0, p0, Lb/f/a/b/f;->p:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_68

    const-string v0, "transitionPathRotate"

    .line 22
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 23
    :cond_68
    iget v0, p0, Lb/f/a/b/f;->u:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_75

    const-string v0, "translationX"

    .line 24
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_75
    iget v0, p0, Lb/f/a/b/f;->v:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_82

    const-string v0, "translationY"

    .line 26
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    :cond_82
    iget v0, p0, Lb/f/a/b/f;->w:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_8f

    const-string v0, "translationZ"

    .line 28
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 29
    :cond_8f
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_c2

    .line 30
    iget-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c2

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

    invoke-virtual {p1, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_a1

    :cond_c2
    return-void
.end method

.method public b(Ljava/lang/String;)F
    .registers 4

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_d8

    goto/16 :goto_93

    :sswitch_9
    const-string v0, "waveOffset"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/16 v0, 0xb

    goto/16 :goto_94

    :sswitch_15
    const-string v0, "alpha"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x0

    goto/16 :goto_94

    :sswitch_20
    const-string v0, "transitionPathRotate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x5

    goto/16 :goto_94

    :sswitch_2b
    const-string v0, "elevation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x1

    goto :goto_94

    :sswitch_35
    const-string v0, "rotation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x2

    goto :goto_94

    :sswitch_3f
    const-string v0, "scaleY"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x7

    goto :goto_94

    :sswitch_49
    const-string v0, "scaleX"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x6

    goto :goto_94

    :sswitch_53
    const-string v0, "progress"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/16 v0, 0xc

    goto :goto_94

    :sswitch_5e
    const-string v0, "translationZ"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/16 v0, 0xa

    goto :goto_94

    :sswitch_69
    const-string v0, "translationY"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/16 v0, 0x9

    goto :goto_94

    :sswitch_74
    const-string v0, "translationX"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/16 v0, 0x8

    goto :goto_94

    :sswitch_7f
    const-string v0, "rotationY"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x4

    goto :goto_94

    :sswitch_89
    const-string v0, "rotationX"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_93

    const/4 v0, 0x3

    goto :goto_94

    :cond_93
    :goto_93
    const/4 v0, -0x1

    :goto_94
    packed-switch v0, :pswitch_data_10e

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  UNKNOWN  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "WARNING! KeyCycle"

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/high16 p1, 0x7fc00000    # Float.NaN

    return p1

    .line 6
    :pswitch_b0
    iget p1, p0, Lb/f/a/b/f;->k:F

    return p1

    .line 7
    :pswitch_b3
    iget p1, p0, Lb/f/a/b/f;->j:F

    return p1

    .line 8
    :pswitch_b6
    iget p1, p0, Lb/f/a/b/f;->w:F

    return p1

    .line 9
    :pswitch_b9
    iget p1, p0, Lb/f/a/b/f;->v:F

    return p1

    .line 10
    :pswitch_bc
    iget p1, p0, Lb/f/a/b/f;->u:F

    return p1

    .line 11
    :pswitch_bf
    iget p1, p0, Lb/f/a/b/f;->t:F

    return p1

    .line 12
    :pswitch_c2
    iget p1, p0, Lb/f/a/b/f;->s:F

    return p1

    .line 13
    :pswitch_c5
    iget p1, p0, Lb/f/a/b/f;->p:F

    return p1

    .line 14
    :pswitch_c8
    iget p1, p0, Lb/f/a/b/f;->r:F

    return p1

    .line 15
    :pswitch_cb
    iget p1, p0, Lb/f/a/b/f;->q:F

    return p1

    .line 16
    :pswitch_ce
    iget p1, p0, Lb/f/a/b/f;->o:F

    return p1

    .line 17
    :pswitch_d1
    iget p1, p0, Lb/f/a/b/f;->n:F

    return p1

    .line 18
    :pswitch_d4
    iget p1, p0, Lb/f/a/b/f;->m:F

    return p1

    nop

    :sswitch_data_d8
    .sparse-switch
        -0x4a771f66 -> :sswitch_89
        -0x4a771f65 -> :sswitch_7f
        -0x490b9c39 -> :sswitch_74
        -0x490b9c38 -> :sswitch_69
        -0x490b9c37 -> :sswitch_5e
        -0x3bab3dd3 -> :sswitch_53
        -0x3621dfb2 -> :sswitch_49
        -0x3621dfb1 -> :sswitch_3f
        -0x266f082 -> :sswitch_35
        -0x42d1a3 -> :sswitch_2b
        0x2382115 -> :sswitch_20
        0x589b15e -> :sswitch_15
        0x94e04ec -> :sswitch_9
    .end sparse-switch

    :pswitch_data_10e
    .packed-switch 0x0
        :pswitch_d4
        :pswitch_d1
        :pswitch_ce
        :pswitch_cb
        :pswitch_c8
        :pswitch_c5
        :pswitch_c2
        :pswitch_bf
        :pswitch_bc
        :pswitch_b9
        :pswitch_b6
        :pswitch_b3
        :pswitch_b0
    .end packed-switch
.end method

.method public c(Ljava/util/HashMap;)V
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/g;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 4
    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "CUSTOM"

    .line 5
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_50

    const/4 v4, 0x7

    .line 6
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 7
    iget-object v5, v0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lb/f/c/a;

    if-eqz v12, :cond_50

    .line 8
    invoke-virtual {v12}, Lb/f/c/a;->a()Lb/f/c/a$b;

    move-result-object v4

    sget-object v5, Lb/f/c/a$b;->FLOAT_TYPE:Lb/f/c/a$b;

    if-ne v4, v5, :cond_50

    .line 9
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lb/f/a/b/g;

    iget v6, v0, Lb/f/a/b/c;->a:I

    iget v7, v0, Lb/f/a/b/f;->h:I

    iget v8, v0, Lb/f/a/b/f;->l:I

    iget v9, v0, Lb/f/a/b/f;->i:F

    iget v10, v0, Lb/f/a/b/f;->j:F

    invoke-virtual {v12}, Lb/f/c/a;->b()F

    move-result v11

    invoke-virtual/range {v5 .. v12}, Lb/f/a/b/g;->a(IIIFFFLb/f/c/a;)V

    .line 10
    :cond_50
    invoke-virtual {v0, v3}, Lb/f/a/b/f;->b(Ljava/lang/String;)F

    move-result v19

    .line 11
    invoke-static/range {v19 .. v19}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_c

    .line 12
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Lb/f/a/b/g;

    iget v14, v0, Lb/f/a/b/c;->a:I

    iget v15, v0, Lb/f/a/b/f;->h:I

    iget v3, v0, Lb/f/a/b/f;->l:I

    iget v4, v0, Lb/f/a/b/f;->i:F

    iget v5, v0, Lb/f/a/b/f;->j:F

    move/from16 v16, v3

    move/from16 v17, v4

    move/from16 v18, v5

    invoke-virtual/range {v13 .. v19}, Lb/f/a/b/g;->a(IIIFFF)V

    goto :goto_c

    :cond_75
    return-void
.end method
