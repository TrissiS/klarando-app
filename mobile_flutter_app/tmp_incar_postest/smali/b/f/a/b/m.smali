.class public Lb/f/a/b/m;
.super Ljava/lang/Object;
.source "MotionConstrainedPoint.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lb/f/a/b/m;",
        ">;"
    }
.end annotation


# instance fields
.field public h:F

.field public i:I

.field public j:I

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

.field public v:F

.field public w:F

.field public x:F

.field public y:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lb/f/c/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    iput v0, p0, Lb/f/a/b/m;->h:F

    const/4 v1, 0x0

    .line 3
    iput v1, p0, Lb/f/a/b/m;->i:I

    const/4 v1, 0x0

    .line 4
    iput v1, p0, Lb/f/a/b/m;->k:F

    .line 5
    iput v1, p0, Lb/f/a/b/m;->l:F

    .line 6
    iput v1, p0, Lb/f/a/b/m;->m:F

    .line 7
    iput v1, p0, Lb/f/a/b/m;->n:F

    .line 8
    iput v0, p0, Lb/f/a/b/m;->o:F

    .line 9
    iput v0, p0, Lb/f/a/b/m;->p:F

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 10
    iput v0, p0, Lb/f/a/b/m;->q:F

    .line 11
    iput v0, p0, Lb/f/a/b/m;->r:F

    .line 12
    iput v1, p0, Lb/f/a/b/m;->s:F

    .line 13
    iput v1, p0, Lb/f/a/b/m;->t:F

    .line 14
    iput v1, p0, Lb/f/a/b/m;->u:F

    .line 15
    iput v0, p0, Lb/f/a/b/m;->w:F

    .line 16
    iput v0, p0, Lb/f/a/b/m;->x:F

    .line 17
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lb/f/a/b/m;->y:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public a(Lb/f/a/b/m;)I
    .registers 3

    .line 34
    iget v0, p0, Lb/f/a/b/m;->v:F

    iget p1, p1, Lb/f/a/b/m;->v:F

    invoke-static {v0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p1

    return p1
.end method

.method public a(FFFF)V
    .registers 5

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 4

    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->j:I

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    :goto_12
    iput v0, p0, Lb/f/a/b/m;->h:F

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_20

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getElevation()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->k:F

    .line 39
    :cond_20
    invoke-virtual {p1}, Landroid/view/View;->getRotation()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->l:F

    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getRotationX()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->m:F

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getRotationY()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->n:F

    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->o:F

    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->p:F

    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getPivotX()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->q:F

    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getPivotY()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->r:F

    .line 46
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->s:F

    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result v0

    iput v0, p0, Lb/f/a/b/m;->t:F

    .line 48
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_60

    .line 49
    invoke-virtual {p1}, Landroid/view/View;->getTranslationZ()F

    move-result p1

    iput p1, p0, Lb/f/a/b/m;->u:F

    :cond_60
    return-void
.end method

.method public a(Lb/f/a/b/m;Ljava/util/HashSet;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/a/b/m;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 4
    iget v0, p0, Lb/f/a/b/m;->h:F

    iget v1, p1, Lb/f/a/b/m;->h:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    const-string v1, "alpha"

    if-eqz v0, :cond_f

    .line 5
    invoke-virtual {p2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 6
    :cond_f
    iget v0, p0, Lb/f/a/b/m;->k:F

    iget v2, p1, Lb/f/a/b/m;->k:F

    invoke-virtual {p0, v0, v2}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_1e

    const-string v0, "elevation"

    .line 7
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 8
    :cond_1e
    iget v0, p0, Lb/f/a/b/m;->j:I

    iget v2, p1, Lb/f/a/b/m;->j:I

    if-eq v0, v2, :cond_2f

    iget v3, p0, Lb/f/a/b/m;->i:I

    if-nez v3, :cond_2f

    if-eqz v0, :cond_2c

    if-nez v2, :cond_2f

    .line 9
    :cond_2c
    invoke-virtual {p2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 10
    :cond_2f
    iget v0, p0, Lb/f/a/b/m;->l:F

    iget v1, p1, Lb/f/a/b/m;->l:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_3e

    const-string v0, "rotation"

    .line 11
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 12
    :cond_3e
    iget v0, p0, Lb/f/a/b/m;->w:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget v0, p1, Lb/f/a/b/m;->w:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_53

    :cond_4e
    const-string v0, "transitionPathRotate"

    .line 13
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 14
    :cond_53
    iget v0, p0, Lb/f/a/b/m;->x:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_63

    iget v0, p1, Lb/f/a/b/m;->x:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_68

    :cond_63
    const-string v0, "progress"

    .line 15
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    :cond_68
    iget v0, p0, Lb/f/a/b/m;->m:F

    iget v1, p1, Lb/f/a/b/m;->m:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_77

    const-string v0, "rotationX"

    .line 17
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 18
    :cond_77
    iget v0, p0, Lb/f/a/b/m;->n:F

    iget v1, p1, Lb/f/a/b/m;->n:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_86

    const-string v0, "rotationY"

    .line 19
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 20
    :cond_86
    iget v0, p0, Lb/f/a/b/m;->q:F

    iget v1, p1, Lb/f/a/b/m;->q:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_95

    const-string v0, "transformPivotX"

    .line 21
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 22
    :cond_95
    iget v0, p0, Lb/f/a/b/m;->r:F

    iget v1, p1, Lb/f/a/b/m;->r:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_a4

    const-string v0, "transformPivotY"

    .line 23
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 24
    :cond_a4
    iget v0, p0, Lb/f/a/b/m;->o:F

    iget v1, p1, Lb/f/a/b/m;->o:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_b3

    const-string v0, "scaleX"

    .line 25
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 26
    :cond_b3
    iget v0, p0, Lb/f/a/b/m;->p:F

    iget v1, p1, Lb/f/a/b/m;->p:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_c2

    const-string v0, "scaleY"

    .line 27
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 28
    :cond_c2
    iget v0, p0, Lb/f/a/b/m;->s:F

    iget v1, p1, Lb/f/a/b/m;->s:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_d1

    const-string v0, "translationX"

    .line 29
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 30
    :cond_d1
    iget v0, p0, Lb/f/a/b/m;->t:F

    iget v1, p1, Lb/f/a/b/m;->t:F

    invoke-virtual {p0, v0, v1}, Lb/f/a/b/m;->a(FF)Z

    move-result v0

    if-eqz v0, :cond_e0

    const-string v0, "translationY"

    .line 31
    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 32
    :cond_e0
    iget v0, p0, Lb/f/a/b/m;->u:F

    iget p1, p1, Lb/f/a/b/m;->u:F

    invoke-virtual {p0, v0, p1}, Lb/f/a/b/m;->a(FF)Z

    move-result p1

    if-eqz p1, :cond_ef

    const-string p1, "translationZ"

    .line 33
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_ef
    return-void
.end method

.method public a(Lb/f/b/k/e;Lb/f/c/c;I)V
    .registers 7

    .line 102
    invoke-virtual {p1}, Lb/f/b/k/e;->B()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Lb/f/b/k/e;->C()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, v0, v1, v2, p1}, Lb/f/a/b/m;->a(FFFF)V

    .line 103
    invoke-virtual {p2, p3}, Lb/f/c/c;->d(I)Lb/f/c/c$a;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/f/a/b/m;->a(Lb/f/c/c$a;)V

    return-void
.end method

.method public a(Lb/f/c/c$a;)V
    .registers 7

    .line 50
    iget-object v0, p1, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v1, v0, Lb/f/c/c$d;->c:I

    iput v1, p0, Lb/f/a/b/m;->i:I

    .line 51
    iget v0, v0, Lb/f/c/c$d;->b:I

    iput v0, p0, Lb/f/a/b/m;->j:I

    if-eqz v0, :cond_10

    if-nez v1, :cond_10

    const/4 v0, 0x0

    goto :goto_14

    .line 52
    :cond_10
    iget-object v0, p1, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v0, v0, Lb/f/c/c$d;->d:F

    :goto_14
    iput v0, p0, Lb/f/a/b/m;->h:F

    .line 53
    iget-object v0, p1, Lb/f/c/c$a;->e:Lb/f/c/c$e;

    iget-boolean v1, v0, Lb/f/c/c$e;->l:Z

    .line 54
    iget v1, v0, Lb/f/c/c$e;->m:F

    iput v1, p0, Lb/f/a/b/m;->k:F

    .line 55
    iget v1, v0, Lb/f/c/c$e;->b:F

    iput v1, p0, Lb/f/a/b/m;->l:F

    .line 56
    iget v1, v0, Lb/f/c/c$e;->c:F

    iput v1, p0, Lb/f/a/b/m;->m:F

    .line 57
    iget v1, v0, Lb/f/c/c$e;->d:F

    iput v1, p0, Lb/f/a/b/m;->n:F

    .line 58
    iget v1, v0, Lb/f/c/c$e;->e:F

    iput v1, p0, Lb/f/a/b/m;->o:F

    .line 59
    iget v1, v0, Lb/f/c/c$e;->f:F

    iput v1, p0, Lb/f/a/b/m;->p:F

    .line 60
    iget v1, v0, Lb/f/c/c$e;->g:F

    iput v1, p0, Lb/f/a/b/m;->q:F

    .line 61
    iget v1, v0, Lb/f/c/c$e;->h:F

    iput v1, p0, Lb/f/a/b/m;->r:F

    .line 62
    iget v1, v0, Lb/f/c/c$e;->i:F

    iput v1, p0, Lb/f/a/b/m;->s:F

    .line 63
    iget v1, v0, Lb/f/c/c$e;->j:F

    iput v1, p0, Lb/f/a/b/m;->t:F

    .line 64
    iget v0, v0, Lb/f/c/c$e;->k:F

    iput v0, p0, Lb/f/a/b/m;->u:F

    .line 65
    iget-object v0, p1, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget-object v0, v0, Lb/f/c/c$c;->c:Ljava/lang/String;

    invoke-static {v0}, Lb/f/a/a/c;->a(Ljava/lang/String;)Lb/f/a/a/c;

    .line 66
    iget-object v0, p1, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget v1, v0, Lb/f/c/c$c;->g:F

    iput v1, p0, Lb/f/a/b/m;->w:F

    .line 67
    iget v0, v0, Lb/f/c/c$c;->e:I

    .line 68
    iget-object v0, p1, Lb/f/c/c$a;->b:Lb/f/c/c$d;

    iget v0, v0, Lb/f/c/c$d;->e:F

    iput v0, p0, Lb/f/a/b/m;->x:F

    .line 69
    iget-object v0, p1, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 70
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_65
    :goto_65
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_87

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 71
    iget-object v2, p1, Lb/f/c/c$a;->f:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/c/a;

    .line 72
    invoke-virtual {v2}, Lb/f/c/a;->a()Lb/f/c/a$b;

    move-result-object v3

    sget-object v4, Lb/f/c/a$b;->STRING_TYPE:Lb/f/c/a$b;

    if-eq v3, v4, :cond_65

    .line 73
    iget-object v3, p0, Lb/f/a/b/m;->y:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_65

    :cond_87
    return-void
.end method

.method public a(Ljava/util/HashMap;I)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/r;",
            ">;I)V"
        }
    .end annotation

    .line 74
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_221

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 75
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/r;

    const/4 v3, -0x1

    .line 76
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v5, 0x1

    sparse-switch v4, :sswitch_data_222

    goto/16 :goto_ba

    :sswitch_25
    const-string v4, "alpha"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x0

    goto/16 :goto_ba

    :sswitch_30
    const-string v4, "transitionPathRotate"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x7

    goto/16 :goto_ba

    :sswitch_3b
    const-string v4, "elevation"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x1

    goto/16 :goto_ba

    :sswitch_46
    const-string v4, "rotation"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x2

    goto/16 :goto_ba

    :sswitch_51
    const-string v4, "transformPivotY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x6

    goto :goto_ba

    :sswitch_5b
    const-string v4, "transformPivotX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x5

    goto :goto_ba

    :sswitch_65
    const-string v4, "scaleY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/16 v3, 0xa

    goto :goto_ba

    :sswitch_70
    const-string v4, "scaleX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/16 v3, 0x9

    goto :goto_ba

    :sswitch_7b
    const-string v4, "progress"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/16 v3, 0x8

    goto :goto_ba

    :sswitch_86
    const-string v4, "translationZ"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/16 v3, 0xd

    goto :goto_ba

    :sswitch_91
    const-string v4, "translationY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/16 v3, 0xc

    goto :goto_ba

    :sswitch_9c
    const-string v4, "translationX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/16 v3, 0xb

    goto :goto_ba

    :sswitch_a7
    const-string v4, "rotationY"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x4

    goto :goto_ba

    :sswitch_b1
    const-string v4, "rotationX"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const/4 v3, 0x3

    :cond_ba
    :goto_ba
    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    packed-switch v3, :pswitch_data_25c

    const-string v3, "CUSTOM"

    .line 77
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "MotionPaths"

    if-eqz v3, :cond_20b

    const-string v3, ","

    .line 78
    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v5

    .line 79
    iget-object v5, p0, Lb/f/a/b/m;->y:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v3}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f5

    .line 80
    iget-object v5, p0, Lb/f/a/b/m;->y:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/c/a;

    .line 81
    instance-of v5, v2, Lb/f/a/b/r$b;

    if-eqz v5, :cond_1cd

    .line 82
    check-cast v2, Lb/f/a/b/r$b;

    invoke-virtual {v2, p2, v3}, Lb/f/a/b/r$b;->a(ILb/f/c/a;)V

    goto/16 :goto_8

    .line 83
    :pswitch_ed
    iget v1, p0, Lb/f/a/b/m;->u:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_f6

    goto :goto_f8

    :cond_f6
    iget v6, p0, Lb/f/a/b/m;->u:F

    :goto_f8
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 84
    :pswitch_fd
    iget v1, p0, Lb/f/a/b/m;->t:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_106

    goto :goto_108

    :cond_106
    iget v6, p0, Lb/f/a/b/m;->t:F

    :goto_108
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 85
    :pswitch_10d
    iget v1, p0, Lb/f/a/b/m;->s:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_116

    goto :goto_118

    :cond_116
    iget v6, p0, Lb/f/a/b/m;->s:F

    :goto_118
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 86
    :pswitch_11d
    iget v1, p0, Lb/f/a/b/m;->p:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_126

    goto :goto_128

    :cond_126
    iget v4, p0, Lb/f/a/b/m;->p:F

    :goto_128
    invoke-virtual {v2, p2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 87
    :pswitch_12d
    iget v1, p0, Lb/f/a/b/m;->o:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_136

    goto :goto_138

    :cond_136
    iget v4, p0, Lb/f/a/b/m;->o:F

    :goto_138
    invoke-virtual {v2, p2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 88
    :pswitch_13d
    iget v1, p0, Lb/f/a/b/m;->x:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_146

    goto :goto_148

    :cond_146
    iget v6, p0, Lb/f/a/b/m;->x:F

    :goto_148
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 89
    :pswitch_14d
    iget v1, p0, Lb/f/a/b/m;->w:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_156

    goto :goto_158

    :cond_156
    iget v6, p0, Lb/f/a/b/m;->w:F

    :goto_158
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 90
    :pswitch_15d
    iget v1, p0, Lb/f/a/b/m;->r:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_166

    goto :goto_168

    :cond_166
    iget v6, p0, Lb/f/a/b/m;->r:F

    :goto_168
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 91
    :pswitch_16d
    iget v1, p0, Lb/f/a/b/m;->q:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_176

    goto :goto_178

    :cond_176
    iget v6, p0, Lb/f/a/b/m;->q:F

    :goto_178
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 92
    :pswitch_17d
    iget v1, p0, Lb/f/a/b/m;->n:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_186

    goto :goto_188

    :cond_186
    iget v6, p0, Lb/f/a/b/m;->n:F

    :goto_188
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 93
    :pswitch_18d
    iget v1, p0, Lb/f/a/b/m;->m:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_196

    goto :goto_198

    :cond_196
    iget v6, p0, Lb/f/a/b/m;->m:F

    :goto_198
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 94
    :pswitch_19d
    iget v1, p0, Lb/f/a/b/m;->l:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_1a6

    goto :goto_1a8

    :cond_1a6
    iget v6, p0, Lb/f/a/b/m;->l:F

    :goto_1a8
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 95
    :pswitch_1ad
    iget v1, p0, Lb/f/a/b/m;->k:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_1b6

    goto :goto_1b8

    :cond_1b6
    iget v6, p0, Lb/f/a/b/m;->k:F

    :goto_1b8
    invoke-virtual {v2, p2, v6}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 96
    :pswitch_1bd
    iget v1, p0, Lb/f/a/b/m;->h:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_1c6

    goto :goto_1c8

    :cond_1c6
    iget v4, p0, Lb/f/a/b/m;->h:F

    :goto_1c8
    invoke-virtual {v2, p2, v4}, Lb/f/a/b/r;->a(IF)V

    goto/16 :goto_8

    .line 97
    :cond_1cd
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " splineSet not a CustomSet frame = "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", value"

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {v3}, Lb/f/c/a;->b()F

    move-result v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 99
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 100
    :cond_1f5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UNKNOWN customName "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 101
    :cond_20b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UNKNOWN spline "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    :cond_221
    return-void

    :sswitch_data_222
    .sparse-switch
        -0x4a771f66 -> :sswitch_b1
        -0x4a771f65 -> :sswitch_a7
        -0x490b9c39 -> :sswitch_9c
        -0x490b9c38 -> :sswitch_91
        -0x490b9c37 -> :sswitch_86
        -0x3bab3dd3 -> :sswitch_7b
        -0x3621dfb2 -> :sswitch_70
        -0x3621dfb1 -> :sswitch_65
        -0x2d5a2d1e -> :sswitch_5b
        -0x2d5a2d1d -> :sswitch_51
        -0x266f082 -> :sswitch_46
        -0x42d1a3 -> :sswitch_3b
        0x2382115 -> :sswitch_30
        0x589b15e -> :sswitch_25
    .end sparse-switch

    :pswitch_data_25c
    .packed-switch 0x0
        :pswitch_1bd
        :pswitch_1ad
        :pswitch_19d
        :pswitch_18d
        :pswitch_17d
        :pswitch_16d
        :pswitch_15d
        :pswitch_14d
        :pswitch_13d
        :pswitch_12d
        :pswitch_11d
        :pswitch_10d
        :pswitch_fd
        :pswitch_ed
    .end packed-switch
.end method

.method public final a(FF)Z
    .registers 6

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1e

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_1e

    :cond_f
    sub-float/2addr p1, p2

    .line 2
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const p2, 0x358637bd    # 1.0E-6f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1c

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x0

    :goto_1d
    return v1

    .line 3
    :cond_1e
    :goto_1e
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result p2

    if-eq p1, p2, :cond_29

    goto :goto_2a

    :cond_29
    const/4 v1, 0x0

    :goto_2a
    return v1
.end method

.method public b(Landroid/view/View;)V
    .registers 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lb/f/a/b/m;->a(FFFF)V

    .line 2
    invoke-virtual {p0, p1}, Lb/f/a/b/m;->a(Landroid/view/View;)V

    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 1
    check-cast p1, Lb/f/a/b/m;

    invoke-virtual {p0, p1}, Lb/f/a/b/m;->a(Lb/f/a/b/m;)I

    move-result p1

    return p1
.end method
