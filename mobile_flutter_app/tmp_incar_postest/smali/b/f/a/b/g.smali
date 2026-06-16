.class public abstract Lb/f/a/b/g;
.super Ljava/lang/Object;
.source "KeyCycleOscillator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/g$d;,
        Lb/f/a/b/g$g;,
        Lb/f/a/b/g$c;,
        Lb/f/a/b/g$o;,
        Lb/f/a/b/g$n;,
        Lb/f/a/b/g$m;,
        Lb/f/a/b/g$l;,
        Lb/f/a/b/g$k;,
        Lb/f/a/b/g$f;,
        Lb/f/a/b/g$j;,
        Lb/f/a/b/g$i;,
        Lb/f/a/b/g$h;,
        Lb/f/a/b/g$b;,
        Lb/f/a/b/g$e;,
        Lb/f/a/b/g$p;
    }
.end annotation


# instance fields
.field public a:Lb/f/a/b/g$d;

.field public b:Lb/f/c/a;

.field public c:Ljava/lang/String;

.field public d:I

.field public e:I

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/g$p;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/f/a/b/g;->d:I

    .line 3
    iput v0, p0, Lb/f/a/b/g;->e:I

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/a/b/g;->f:Ljava/util/ArrayList;

    return-void
.end method

.method public static b(Ljava/lang/String;)Lb/f/a/b/g;
    .registers 3

    const-string v0, "CUSTOM"

    .line 2
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 3
    new-instance p0, Lb/f/a/b/g$c;

    invoke-direct {p0}, Lb/f/a/b/g$c;-><init>()V

    return-object p0

    :cond_e
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_106

    goto/16 :goto_ad

    :sswitch_18
    const-string v1, "waveOffset"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/16 v0, 0x8

    goto/16 :goto_ad

    :sswitch_24
    const-string v1, "alpha"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x0

    goto/16 :goto_ad

    :sswitch_2f
    const-string v1, "transitionPathRotate"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x5

    goto/16 :goto_ad

    :sswitch_3a
    const-string v1, "elevation"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x1

    goto/16 :goto_ad

    :sswitch_45
    const-string v1, "rotation"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x2

    goto :goto_ad

    :sswitch_4f
    const-string v1, "waveVariesBy"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/16 v0, 0x9

    goto :goto_ad

    :sswitch_5a
    const-string v1, "scaleY"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x7

    goto :goto_ad

    :sswitch_64
    const-string v1, "scaleX"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x6

    goto :goto_ad

    :sswitch_6e
    const-string v1, "progress"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/16 v0, 0xd

    goto :goto_ad

    :sswitch_79
    const-string v1, "translationZ"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/16 v0, 0xc

    goto :goto_ad

    :sswitch_84
    const-string v1, "translationY"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/16 v0, 0xb

    goto :goto_ad

    :sswitch_8f
    const-string v1, "translationX"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/16 v0, 0xa

    goto :goto_ad

    :sswitch_9a
    const-string v1, "rotationY"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x4

    goto :goto_ad

    :sswitch_a4
    const-string v1, "rotationX"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_ad

    const/4 v0, 0x3

    :cond_ad
    :goto_ad
    packed-switch v0, :pswitch_data_140

    const/4 p0, 0x0

    return-object p0

    .line 5
    :pswitch_b2
    new-instance p0, Lb/f/a/b/g$g;

    invoke-direct {p0}, Lb/f/a/b/g$g;-><init>()V

    return-object p0

    .line 6
    :pswitch_b8
    new-instance p0, Lb/f/a/b/g$o;

    invoke-direct {p0}, Lb/f/a/b/g$o;-><init>()V

    return-object p0

    .line 7
    :pswitch_be
    new-instance p0, Lb/f/a/b/g$n;

    invoke-direct {p0}, Lb/f/a/b/g$n;-><init>()V

    return-object p0

    .line 8
    :pswitch_c4
    new-instance p0, Lb/f/a/b/g$m;

    invoke-direct {p0}, Lb/f/a/b/g$m;-><init>()V

    return-object p0

    .line 9
    :pswitch_ca
    new-instance p0, Lb/f/a/b/g$b;

    invoke-direct {p0}, Lb/f/a/b/g$b;-><init>()V

    return-object p0

    .line 10
    :pswitch_d0
    new-instance p0, Lb/f/a/b/g$b;

    invoke-direct {p0}, Lb/f/a/b/g$b;-><init>()V

    return-object p0

    .line 11
    :pswitch_d6
    new-instance p0, Lb/f/a/b/g$l;

    invoke-direct {p0}, Lb/f/a/b/g$l;-><init>()V

    return-object p0

    .line 12
    :pswitch_dc
    new-instance p0, Lb/f/a/b/g$k;

    invoke-direct {p0}, Lb/f/a/b/g$k;-><init>()V

    return-object p0

    .line 13
    :pswitch_e2
    new-instance p0, Lb/f/a/b/g$f;

    invoke-direct {p0}, Lb/f/a/b/g$f;-><init>()V

    return-object p0

    .line 14
    :pswitch_e8
    new-instance p0, Lb/f/a/b/g$j;

    invoke-direct {p0}, Lb/f/a/b/g$j;-><init>()V

    return-object p0

    .line 15
    :pswitch_ee
    new-instance p0, Lb/f/a/b/g$i;

    invoke-direct {p0}, Lb/f/a/b/g$i;-><init>()V

    return-object p0

    .line 16
    :pswitch_f4
    new-instance p0, Lb/f/a/b/g$h;

    invoke-direct {p0}, Lb/f/a/b/g$h;-><init>()V

    return-object p0

    .line 17
    :pswitch_fa
    new-instance p0, Lb/f/a/b/g$e;

    invoke-direct {p0}, Lb/f/a/b/g$e;-><init>()V

    return-object p0

    .line 18
    :pswitch_100
    new-instance p0, Lb/f/a/b/g$b;

    invoke-direct {p0}, Lb/f/a/b/g$b;-><init>()V

    return-object p0

    :sswitch_data_106
    .sparse-switch
        -0x4a771f66 -> :sswitch_a4
        -0x4a771f65 -> :sswitch_9a
        -0x490b9c39 -> :sswitch_8f
        -0x490b9c38 -> :sswitch_84
        -0x490b9c37 -> :sswitch_79
        -0x3bab3dd3 -> :sswitch_6e
        -0x3621dfb2 -> :sswitch_64
        -0x3621dfb1 -> :sswitch_5a
        -0x2f893320 -> :sswitch_4f
        -0x266f082 -> :sswitch_45
        -0x42d1a3 -> :sswitch_3a
        0x2382115 -> :sswitch_2f
        0x589b15e -> :sswitch_24
        0x94e04ec -> :sswitch_18
    .end sparse-switch

    :pswitch_data_140
    .packed-switch 0x0
        :pswitch_100
        :pswitch_fa
        :pswitch_f4
        :pswitch_ee
        :pswitch_e8
        :pswitch_e2
        :pswitch_dc
        :pswitch_d6
        :pswitch_d0
        :pswitch_ca
        :pswitch_c4
        :pswitch_be
        :pswitch_b8
        :pswitch_b2
    .end packed-switch
.end method


# virtual methods
.method public a(F)F
    .registers 4

    .line 3
    iget-object v0, p0, Lb/f/a/b/g;->a:Lb/f/a/b/g$d;

    invoke-virtual {v0, p1}, Lb/f/a/b/g$d;->b(F)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public a(IIIFFF)V
    .registers 9

    .line 8
    iget-object v0, p0, Lb/f/a/b/g;->f:Ljava/util/ArrayList;

    new-instance v1, Lb/f/a/b/g$p;

    invoke-direct {v1, p1, p4, p5, p6}, Lb/f/a/b/g$p;-><init>(IFFF)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, -0x1

    if-eq p3, p1, :cond_f

    .line 9
    iput p3, p0, Lb/f/a/b/g;->e:I

    .line 10
    :cond_f
    iput p2, p0, Lb/f/a/b/g;->d:I

    return-void
.end method

.method public a(IIIFFFLb/f/c/a;)V
    .registers 10

    .line 4
    iget-object v0, p0, Lb/f/a/b/g;->f:Ljava/util/ArrayList;

    new-instance v1, Lb/f/a/b/g$p;

    invoke-direct {v1, p1, p4, p5, p6}, Lb/f/a/b/g$p;-><init>(IFFF)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, -0x1

    if-eq p3, p1, :cond_f

    .line 5
    iput p3, p0, Lb/f/a/b/g;->e:I

    .line 6
    :cond_f
    iput p2, p0, Lb/f/a/b/g;->d:I

    .line 7
    iput-object p7, p0, Lb/f/a/b/g;->b:Lb/f/c/a;

    return-void
.end method

.method public abstract a(Landroid/view/View;F)V
.end method

.method public a(Ljava/lang/String;)V
    .registers 2

    .line 2
    iput-object p1, p0, Lb/f/a/b/g;->c:Ljava/lang/String;

    return-void
.end method

.method public a()Z
    .registers 3

    .line 1
    iget v0, p0, Lb/f/a/b/g;->e:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    goto :goto_7

    :cond_6
    const/4 v1, 0x0

    :goto_7
    return v1
.end method

.method public b(F)F
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/a/b/g;->a:Lb/f/a/b/g$d;

    invoke-virtual {v0, p1}, Lb/f/a/b/g$d;->a(F)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public c(F)V
    .registers 16
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object v0, p0, Lb/f/a/b/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object v1, p0, Lb/f/a/b/g;->f:Ljava/util/ArrayList;

    new-instance v2, Lb/f/a/b/g$a;

    invoke-direct {v2, p0}, Lb/f/a/b/g$a;-><init>(Lb/f/a/b/g;)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 3
    new-array v1, v0, [D

    const/4 v2, 0x2

    new-array v3, v2, [I

    const/4 v4, 0x1

    aput v2, v3, v4

    const/4 v2, 0x0

    aput v0, v3, v2

    .line 4
    const-class v5, D

    invoke-static {v5, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[D

    .line 5
    new-instance v5, Lb/f/a/b/g$d;

    iget v6, p0, Lb/f/a/b/g;->d:I

    iget v7, p0, Lb/f/a/b/g;->e:I

    invoke-direct {v5, v6, v7, v0}, Lb/f/a/b/g$d;-><init>(III)V

    iput-object v5, p0, Lb/f/a/b/g;->a:Lb/f/a/b/g$d;

    .line 6
    iget-object v0, p0, Lb/f/a/b/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v11, 0x0

    :goto_38
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_69

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/a/b/g$p;

    .line 7
    iget v8, v5, Lb/f/a/b/g$p;->d:F

    float-to-double v6, v8

    const-wide v9, 0x3f847ae147ae147bL    # 0.01

    mul-double v6, v6, v9

    aput-wide v6, v1, v11

    .line 8
    aget-object v6, v3, v11

    iget v10, v5, Lb/f/a/b/g$p;->b:F

    float-to-double v12, v10

    aput-wide v12, v6, v2

    .line 9
    aget-object v6, v3, v11

    iget v9, v5, Lb/f/a/b/g$p;->c:F

    float-to-double v12, v9

    aput-wide v12, v6, v4

    .line 10
    iget-object v6, p0, Lb/f/a/b/g;->a:Lb/f/a/b/g$d;

    iget v7, v5, Lb/f/a/b/g$p;->a:I

    move-object v5, v6

    move v6, v11

    invoke-virtual/range {v5 .. v10}, Lb/f/a/b/g$d;->a(IIFFF)V

    add-int/2addr v11, v4

    goto :goto_38

    .line 11
    :cond_69
    iget-object v0, p0, Lb/f/a/b/g;->a:Lb/f/a/b/g$d;

    invoke-virtual {v0, p1}, Lb/f/a/b/g$d;->c(F)V

    .line 12
    invoke-static {v2, v1, v3}, Lb/f/a/a/b;->a(I[D[[D)Lb/f/a/a/b;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .line 1
    iget-object v0, p0, Lb/f/a/b/g;->c:Ljava/lang/String;

    .line 2
    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "##.##"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 3
    iget-object v2, p0, Lb/f/a/b/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_46

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/g$p;

    .line 4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "["

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v3, Lb/f/a/b/g$p;->a:I

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " , "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v3, Lb/f/a/b/g$p;->b:F

    float-to-double v5, v0

    invoke-virtual {v1, v5, v6}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "] "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_46
    return-object v0
.end method
