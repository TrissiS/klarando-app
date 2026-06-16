.class public Lb/h/m/g0;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/m/g0$a;,
        Lb/h/m/g0$m;,
        Lb/h/m/g0$e;,
        Lb/h/m/g0$d;,
        Lb/h/m/g0$c;,
        Lb/h/m/g0$f;,
        Lb/h/m/g0$b;,
        Lb/h/m/g0$k;,
        Lb/h/m/g0$j;,
        Lb/h/m/g0$i;,
        Lb/h/m/g0$h;,
        Lb/h/m/g0$g;,
        Lb/h/m/g0$l;
    }
.end annotation


# static fields
.field public static final b:Lb/h/m/g0;


# instance fields
.field public final a:Lb/h/m/g0$l;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_b

    .line 2
    sget-object v0, Lb/h/m/g0$k;->o:Lb/h/m/g0;

    sput-object v0, Lb/h/m/g0;->b:Lb/h/m/g0;

    goto :goto_f

    .line 3
    :cond_b
    sget-object v0, Lb/h/m/g0$l;->b:Lb/h/m/g0;

    sput-object v0, Lb/h/m/g0;->b:Lb/h/m/g0;

    :goto_f
    return-void
.end method

.method public constructor <init>(Landroid/view/WindowInsets;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_11

    .line 3
    new-instance v0, Lb/h/m/g0$k;

    invoke-direct {v0, p0, p1}, Lb/h/m/g0$k;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_48

    :cond_11
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1d

    .line 4
    new-instance v0, Lb/h/m/g0$j;

    invoke-direct {v0, p0, p1}, Lb/h/m/g0$j;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_48

    :cond_1d
    const/16 v1, 0x1c

    if-lt v0, v1, :cond_29

    .line 5
    new-instance v0, Lb/h/m/g0$i;

    invoke-direct {v0, p0, p1}, Lb/h/m/g0$i;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_48

    :cond_29
    const/16 v1, 0x15

    if-lt v0, v1, :cond_35

    .line 6
    new-instance v0, Lb/h/m/g0$h;

    invoke-direct {v0, p0, p1}, Lb/h/m/g0$h;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_48

    :cond_35
    const/16 v1, 0x14

    if-lt v0, v1, :cond_41

    .line 7
    new-instance v0, Lb/h/m/g0$g;

    invoke-direct {v0, p0, p1}, Lb/h/m/g0$g;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_48

    .line 8
    :cond_41
    new-instance p1, Lb/h/m/g0$l;

    invoke-direct {p1, p0}, Lb/h/m/g0$l;-><init>(Lb/h/m/g0;)V

    iput-object p1, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    :goto_48
    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;)V
    .registers 4

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_7b

    .line 10
    iget-object p1, p1, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    .line 11
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1c

    instance-of v0, p1, Lb/h/m/g0$k;

    if-eqz v0, :cond_1c

    .line 12
    new-instance v0, Lb/h/m/g0$k;

    move-object v1, p1

    check-cast v1, Lb/h/m/g0$k;

    invoke-direct {v0, p0, v1}, Lb/h/m/g0$k;-><init>(Lb/h/m/g0;Lb/h/m/g0$k;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_77

    .line 13
    :cond_1c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_31

    instance-of v0, p1, Lb/h/m/g0$j;

    if-eqz v0, :cond_31

    .line 14
    new-instance v0, Lb/h/m/g0$j;

    move-object v1, p1

    check-cast v1, Lb/h/m/g0$j;

    invoke-direct {v0, p0, v1}, Lb/h/m/g0$j;-><init>(Lb/h/m/g0;Lb/h/m/g0$j;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_77

    .line 15
    :cond_31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_46

    instance-of v0, p1, Lb/h/m/g0$i;

    if-eqz v0, :cond_46

    .line 16
    new-instance v0, Lb/h/m/g0$i;

    move-object v1, p1

    check-cast v1, Lb/h/m/g0$i;

    invoke-direct {v0, p0, v1}, Lb/h/m/g0$i;-><init>(Lb/h/m/g0;Lb/h/m/g0$i;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_77

    .line 17
    :cond_46
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_5b

    instance-of v0, p1, Lb/h/m/g0$h;

    if-eqz v0, :cond_5b

    .line 18
    new-instance v0, Lb/h/m/g0$h;

    move-object v1, p1

    check-cast v1, Lb/h/m/g0$h;

    invoke-direct {v0, p0, v1}, Lb/h/m/g0$h;-><init>(Lb/h/m/g0;Lb/h/m/g0$h;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_77

    .line 19
    :cond_5b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x14

    if-lt v0, v1, :cond_70

    instance-of v0, p1, Lb/h/m/g0$g;

    if-eqz v0, :cond_70

    .line 20
    new-instance v0, Lb/h/m/g0$g;

    move-object v1, p1

    check-cast v1, Lb/h/m/g0$g;

    invoke-direct {v0, p0, v1}, Lb/h/m/g0$g;-><init>(Lb/h/m/g0;Lb/h/m/g0$g;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    goto :goto_77

    .line 21
    :cond_70
    new-instance v0, Lb/h/m/g0$l;

    invoke-direct {v0, p0}, Lb/h/m/g0$l;-><init>(Lb/h/m/g0;)V

    iput-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    .line 22
    :goto_77
    invoke-virtual {p1, p0}, Lb/h/m/g0$l;->a(Lb/h/m/g0;)V

    goto :goto_82

    .line 23
    :cond_7b
    new-instance p1, Lb/h/m/g0$l;

    invoke-direct {p1, p0}, Lb/h/m/g0$l;-><init>(Lb/h/m/g0;)V

    iput-object p1, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    :goto_82
    return-void
.end method

.method public static a(Lb/h/f/b;IIII)Lb/h/f/b;
    .registers 10

    .line 8
    iget v0, p0, Lb/h/f/b;->a:I

    sub-int/2addr v0, p1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 9
    iget v2, p0, Lb/h/f/b;->b:I

    sub-int/2addr v2, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 10
    iget v3, p0, Lb/h/f/b;->c:I

    sub-int/2addr v3, p3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 11
    iget v4, p0, Lb/h/f/b;->d:I

    sub-int/2addr v4, p4

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-ne v0, p1, :cond_26

    if-ne v2, p2, :cond_26

    if-ne v3, p3, :cond_26

    if-ne v1, p4, :cond_26

    return-object p0

    .line 12
    :cond_26
    invoke-static {v0, v2, v3, v1}, Lb/h/f/b;->a(IIII)Lb/h/f/b;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/WindowInsets;)Lb/h/m/g0;
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-static {p0, v0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/WindowInsets;Landroid/view/View;)Lb/h/m/g0;
    .registers 3

    .line 2
    new-instance v0, Lb/h/m/g0;

    invoke-static {p0}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Landroid/view/WindowInsets;

    invoke-direct {v0, p0}, Lb/h/m/g0;-><init>(Landroid/view/WindowInsets;)V

    if-eqz p1, :cond_20

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_20

    .line 4
    invoke-static {p1}, Lb/h/m/y;->z(Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    invoke-virtual {v0, p0}, Lb/h/m/g0;->a(Lb/h/m/g0;)V

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {v0, p0}, Lb/h/m/g0;->a(Landroid/view/View;)V

    :cond_20
    return-object v0
.end method


# virtual methods
.method public a()Lb/h/m/g0;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 6
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->a()Lb/h/m/g0;

    move-result-object v0

    return-object v0
.end method

.method public a(IIII)Lb/h/m/g0;
    .registers 6

    .line 7
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/h/m/g0$l;->a(IIII)Lb/h/m/g0;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    .line 16
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0, p1}, Lb/h/m/g0$l;->a(Landroid/view/View;)V

    return-void
.end method

.method public a(Lb/h/f/b;)V
    .registers 3

    .line 15
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0, p1}, Lb/h/m/g0$l;->a(Lb/h/f/b;)V

    return-void
.end method

.method public a(Lb/h/m/g0;)V
    .registers 3

    .line 14
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0, p1}, Lb/h/m/g0$l;->b(Lb/h/m/g0;)V

    return-void
.end method

.method public a([Lb/h/f/b;)V
    .registers 3

    .line 13
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0, p1}, Lb/h/m/g0$l;->a([Lb/h/f/b;)V

    return-void
.end method

.method public b()Lb/h/m/g0;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 4
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->b()Lb/h/m/g0;

    move-result-object v0

    return-object v0
.end method

.method public b(IIII)Lb/h/m/g0;
    .registers 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Lb/h/m/g0$b;

    invoke-direct {v0, p0}, Lb/h/m/g0$b;-><init>(Lb/h/m/g0;)V

    .line 2
    invoke-static {p1, p2, p3, p4}, Lb/h/f/b;->a(IIII)Lb/h/f/b;

    move-result-object p1

    invoke-virtual {v0, p1}, Lb/h/m/g0$b;->b(Lb/h/f/b;)Lb/h/m/g0$b;

    .line 3
    invoke-virtual {v0}, Lb/h/m/g0$b;->a()Lb/h/m/g0;

    move-result-object p1

    return-object p1
.end method

.method public b(Lb/h/f/b;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0, p1}, Lb/h/m/g0$l;->b(Lb/h/f/b;)V

    return-void
.end method

.method public c()Lb/h/m/g0;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->c()Lb/h/m/g0;

    move-result-object v0

    return-object v0
.end method

.method public d()Lb/h/f/b;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->e()Lb/h/f/b;

    move-result-object v0

    return-object v0
.end method

.method public e()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v0

    iget v0, v0, Lb/h/f/b;->d:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    if-ne p0, p1, :cond_4

    const/4 p1, 0x1

    return p1

    .line 1
    :cond_4
    instance-of v0, p1, Lb/h/m/g0;

    if-nez v0, :cond_a

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_a
    check-cast p1, Lb/h/m/g0;

    .line 3
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    iget-object p1, p1, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-static {v0, p1}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public f()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v0

    iget v0, v0, Lb/h/f/b;->a:I

    return v0
.end method

.method public g()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v0

    iget v0, v0, Lb/h/f/b;->c:I

    return v0
.end method

.method public h()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v0

    iget v0, v0, Lb/h/f/b;->b:I

    return v0
.end method

.method public hashCode()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {v0}, Lb/h/m/g0$l;->hashCode()I

    move-result v0

    :goto_a
    return v0
.end method

.method public i()Z
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v0

    sget-object v1, Lb/h/f/b;->e:Lb/h/f/b;

    invoke-virtual {v0, v1}, Lb/h/f/b;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public j()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    invoke-virtual {v0}, Lb/h/m/g0$l;->h()Z

    move-result v0

    return v0
.end method

.method public k()Landroid/view/WindowInsets;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/g0;->a:Lb/h/m/g0$l;

    instance-of v1, v0, Lb/h/m/g0$g;

    if-eqz v1, :cond_b

    check-cast v0, Lb/h/m/g0$g;

    iget-object v0, v0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method
