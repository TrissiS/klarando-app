.class public Lb/f/b/k/d;
.super Ljava/lang/Object;
.source "ConstraintAnchor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/k/d$b;
    }
.end annotation


# instance fields
.field public a:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lb/f/b/k/d;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lb/f/b/k/e;

.field public final c:Lb/f/b/k/d$b;

.field public d:Lb/f/b/k/d;

.field public e:I

.field public f:I

.field public g:Lb/f/b/i;


# direct methods
.method public constructor <init>(Lb/f/b/k/e;Lb/f/b/k/d$b;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/f/b/k/d;->a:Ljava/util/HashSet;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lb/f/b/k/d;->e:I

    const/4 v0, -0x1

    .line 4
    iput v0, p0, Lb/f/b/k/d;->f:I

    .line 5
    iput-object p1, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    .line 6
    iput-object p2, p0, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    return-void
.end method


# virtual methods
.method public a()I
    .registers 4

    .line 4
    iget-object v0, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->z()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_c

    const/4 v0, 0x0

    return v0

    .line 5
    :cond_c
    iget v0, p0, Lb/f/b/k/d;->f:I

    const/4 v2, -0x1

    if-le v0, v2, :cond_20

    iget-object v0, p0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_20

    iget-object v0, v0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    .line 6
    invoke-virtual {v0}, Lb/f/b/k/e;->z()I

    move-result v0

    if-ne v0, v1, :cond_20

    .line 7
    iget v0, p0, Lb/f/b/k/d;->f:I

    return v0

    .line 8
    :cond_20
    iget v0, p0, Lb/f/b/k/d;->e:I

    return v0
.end method

.method public a(I)V
    .registers 3

    .line 32
    invoke-virtual {p0}, Lb/f/b/k/d;->h()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 33
    iput p1, p0, Lb/f/b/k/d;->f:I

    :cond_8
    return-void
.end method

.method public a(Lb/f/b/c;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lb/f/b/k/d;->g:Lb/f/b/i;

    if-nez p1, :cond_f

    .line 2
    new-instance p1, Lb/f/b/i;

    sget-object v0, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Lb/f/b/i;-><init>(Lb/f/b/i$a;Ljava/lang/String;)V

    iput-object p1, p0, Lb/f/b/k/d;->g:Lb/f/b/i;

    goto :goto_12

    .line 3
    :cond_f
    invoke-virtual {p1}, Lb/f/b/i;->a()V

    :goto_12
    return-void
.end method

.method public a(Lb/f/b/k/d;)Z
    .registers 7

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 19
    :cond_4
    invoke-virtual {p1}, Lb/f/b/k/d;->f()Lb/f/b/k/d$b;

    move-result-object v1

    .line 20
    iget-object v2, p0, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    const/4 v3, 0x1

    if-ne v1, v2, :cond_27

    .line 21
    sget-object v1, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    if-ne v2, v1, :cond_26

    .line 22
    invoke-virtual {p1}, Lb/f/b/k/d;->c()Lb/f/b/k/e;

    move-result-object p1

    invoke-virtual {p1}, Lb/f/b/k/e;->D()Z

    move-result p1

    if-eqz p1, :cond_25

    invoke-virtual {p0}, Lb/f/b/k/d;->c()Lb/f/b/k/e;

    move-result-object p1

    invoke-virtual {p1}, Lb/f/b/k/e;->D()Z

    move-result p1

    if-nez p1, :cond_26

    :cond_25
    return v0

    :cond_26
    return v3

    .line 23
    :cond_27
    sget-object v4, Lb/f/b/k/d$a;->a:[I

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v2, v4, v2

    packed-switch v2, :pswitch_data_88

    .line 24
    new-instance p1, Ljava/lang/AssertionError;

    iget-object v0, p0, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    :pswitch_3e
    return v0

    .line 25
    :pswitch_3f
    sget-object v2, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    if-eq v1, v2, :cond_4a

    sget-object v2, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    if-ne v1, v2, :cond_48

    goto :goto_4a

    :cond_48
    const/4 v2, 0x0

    goto :goto_4b

    :cond_4a
    :goto_4a
    const/4 v2, 0x1

    .line 26
    :goto_4b
    invoke-virtual {p1}, Lb/f/b/k/d;->c()Lb/f/b/k/e;

    move-result-object p1

    instance-of p1, p1, Lb/f/b/k/h;

    if-eqz p1, :cond_5b

    if-nez v2, :cond_59

    .line 27
    sget-object p1, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    if-ne v1, p1, :cond_5a

    :cond_59
    const/4 v0, 0x1

    :cond_5a
    move v2, v0

    :cond_5b
    return v2

    .line 28
    :pswitch_5c
    sget-object v2, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    if-eq v1, v2, :cond_67

    sget-object v2, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    if-ne v1, v2, :cond_65

    goto :goto_67

    :cond_65
    const/4 v2, 0x0

    goto :goto_68

    :cond_67
    :goto_67
    const/4 v2, 0x1

    .line 29
    :goto_68
    invoke-virtual {p1}, Lb/f/b/k/d;->c()Lb/f/b/k/e;

    move-result-object p1

    instance-of p1, p1, Lb/f/b/k/h;

    if-eqz p1, :cond_78

    if-nez v2, :cond_76

    .line 30
    sget-object p1, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    if-ne v1, p1, :cond_77

    :cond_76
    const/4 v0, 0x1

    :cond_77
    move v2, v0

    :cond_78
    return v2

    .line 31
    :pswitch_79
    sget-object p1, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    if-eq v1, p1, :cond_86

    sget-object p1, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    if-eq v1, p1, :cond_86

    sget-object p1, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    if-eq v1, p1, :cond_86

    const/4 v0, 0x1

    :cond_86
    return v0

    nop

    :pswitch_data_88
    .packed-switch 0x1
        :pswitch_79
        :pswitch_5c
        :pswitch_5c
        :pswitch_3f
        :pswitch_3f
        :pswitch_3e
        :pswitch_3e
        :pswitch_3e
        :pswitch_3e
    .end packed-switch
.end method

.method public a(Lb/f/b/k/d;I)Z
    .registers 5

    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 18
    invoke-virtual {p0, p1, p2, v0, v1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;IIZ)Z

    move-result p1

    return p1
.end method

.method public a(Lb/f/b/k/d;IIZ)Z
    .registers 7

    const/4 v0, 0x1

    if-nez p1, :cond_7

    .line 9
    invoke-virtual {p0}, Lb/f/b/k/d;->i()V

    return v0

    :cond_7
    const/4 v1, 0x0

    if-nez p4, :cond_11

    .line 10
    invoke-virtual {p0, p1}, Lb/f/b/k/d;->a(Lb/f/b/k/d;)Z

    move-result p4

    if-nez p4, :cond_11

    return v1

    .line 11
    :cond_11
    iput-object p1, p0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    .line 12
    iget-object p4, p1, Lb/f/b/k/d;->a:Ljava/util/HashSet;

    if-nez p4, :cond_1e

    .line 13
    new-instance p4, Ljava/util/HashSet;

    invoke-direct {p4}, Ljava/util/HashSet;-><init>()V

    iput-object p4, p1, Lb/f/b/k/d;->a:Ljava/util/HashSet;

    .line 14
    :cond_1e
    iget-object p1, p0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    iget-object p1, p1, Lb/f/b/k/d;->a:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    if-lez p2, :cond_2a

    .line 15
    iput p2, p0, Lb/f/b/k/d;->e:I

    goto :goto_2c

    .line 16
    :cond_2a
    iput v1, p0, Lb/f/b/k/d;->e:I

    .line 17
    :goto_2c
    iput p3, p0, Lb/f/b/k/d;->f:I

    return v0
.end method

.method public final b()Lb/f/b/k/d;
    .registers 3

    .line 1
    sget-object v0, Lb/f/b/k/d$a;->a:[I

    iget-object v1, p0, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_30

    .line 2
    new-instance v0, Ljava/lang/AssertionError;

    iget-object v1, p0, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 3
    :pswitch_19
    iget-object v0, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    return-object v0

    .line 4
    :pswitch_1e
    iget-object v0, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    return-object v0

    .line 5
    :pswitch_23
    iget-object v0, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    return-object v0

    .line 6
    :pswitch_28
    iget-object v0, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    return-object v0

    :pswitch_2d
    const/4 v0, 0x0

    return-object v0

    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_2d
        :pswitch_28
        :pswitch_23
        :pswitch_1e
        :pswitch_19
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
    .end packed-switch
.end method

.method public c()Lb/f/b/k/e;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    return-object v0
.end method

.method public d()Lb/f/b/i;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/d;->g:Lb/f/b/i;

    return-object v0
.end method

.method public e()Lb/f/b/k/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    return-object v0
.end method

.method public f()Lb/f/b/k/d$b;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    return-object v0
.end method

.method public g()Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/b/k/d;->a:Ljava/util/HashSet;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/d;

    .line 3
    invoke-virtual {v2}, Lb/f/b/k/d;->b()Lb/f/b/k/d;

    move-result-object v2

    .line 4
    invoke-virtual {v2}, Lb/f/b/k/d;->h()Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v0, 0x1

    return v0

    :cond_22
    return v1
.end method

.method public h()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public i()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_b

    .line 2
    iget-object v0, v0, Lb/f/b/k/d;->a:Ljava/util/HashSet;

    if-eqz v0, :cond_b

    .line 3
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :cond_b
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lb/f/b/k/d;->e:I

    const/4 v0, -0x1

    .line 6
    iput v0, p0, Lb/f/b/k/d;->f:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    invoke-virtual {v1}, Lb/f/b/k/e;->h()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
