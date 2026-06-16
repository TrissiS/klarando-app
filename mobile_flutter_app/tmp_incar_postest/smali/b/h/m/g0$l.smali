.class public Lb/h/m/g0$l;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "l"
.end annotation


# static fields
.field public static final b:Lb/h/m/g0;


# instance fields
.field public final a:Lb/h/m/g0;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lb/h/m/g0$b;

    invoke-direct {v0}, Lb/h/m/g0$b;-><init>()V

    .line 2
    invoke-virtual {v0}, Lb/h/m/g0$b;->a()Lb/h/m/g0;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lb/h/m/g0;->a()Lb/h/m/g0;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Lb/h/m/g0;->b()Lb/h/m/g0;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lb/h/m/g0;->c()Lb/h/m/g0;

    move-result-object v0

    sput-object v0, Lb/h/m/g0$l;->b:Lb/h/m/g0;

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/m/g0$l;->a:Lb/h/m/g0;

    return-void
.end method


# virtual methods
.method public a()Lb/h/m/g0;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$l;->a:Lb/h/m/g0;

    return-object v0
.end method

.method public a(IIII)Lb/h/m/g0;
    .registers 5

    .line 2
    sget-object p1, Lb/h/m/g0$l;->b:Lb/h/m/g0;

    return-object p1
.end method

.method public a(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public a(Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public a(Lb/h/m/g0;)V
    .registers 2

    return-void
.end method

.method public a([Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public b()Lb/h/m/g0;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$l;->a:Lb/h/m/g0;

    return-object v0
.end method

.method public b(Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public b(Lb/h/m/g0;)V
    .registers 2

    return-void
.end method

.method public c()Lb/h/m/g0;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$l;->a:Lb/h/m/g0;

    return-object v0
.end method

.method public d()Lb/h/m/d;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public e()Lb/h/f/b;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 1
    :cond_4
    instance-of v1, p1, Lb/h/m/g0$l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 2
    :cond_a
    check-cast p1, Lb/h/m/g0$l;

    .line 3
    invoke-virtual {p0}, Lb/h/m/g0$l;->i()Z

    move-result v1

    invoke-virtual {p1}, Lb/h/m/g0$l;->i()Z

    move-result v3

    if-ne v1, v3, :cond_4b

    .line 4
    invoke-virtual {p0}, Lb/h/m/g0$l;->h()Z

    move-result v1

    invoke-virtual {p1}, Lb/h/m/g0$l;->h()Z

    move-result v3

    if-ne v1, v3, :cond_4b

    .line 5
    invoke-virtual {p0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v1

    invoke-virtual {p1}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v3

    invoke-static {v1, v3}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 6
    invoke-virtual {p0}, Lb/h/m/g0$l;->f()Lb/h/f/b;

    move-result-object v1

    invoke-virtual {p1}, Lb/h/m/g0$l;->f()Lb/h/f/b;

    move-result-object v3

    invoke-static {v1, v3}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 7
    invoke-virtual {p0}, Lb/h/m/g0$l;->d()Lb/h/m/d;

    move-result-object v1

    invoke-virtual {p1}, Lb/h/m/g0$l;->d()Lb/h/m/d;

    move-result-object p1

    invoke-static {v1, p1}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4b

    goto :goto_4c

    :cond_4b
    const/4 v0, 0x0

    :goto_4c
    return v0
.end method

.method public f()Lb/h/f/b;
    .registers 2

    .line 1
    sget-object v0, Lb/h/f/b;->e:Lb/h/f/b;

    return-object v0
.end method

.method public g()Lb/h/f/b;
    .registers 2

    .line 1
    sget-object v0, Lb/h/f/b;->e:Lb/h/f/b;

    return-object v0
.end method

.method public h()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .registers 4

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    invoke-virtual {p0}, Lb/h/m/g0$l;->i()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lb/h/m/g0$l;->h()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lb/h/m/g0$l;->g()Lb/h/f/b;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 2
    invoke-virtual {p0}, Lb/h/m/g0$l;->f()Lb/h/f/b;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lb/h/m/g0$l;->d()Lb/h/m/d;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 3
    invoke-static {v0}, Lb/h/l/c;->a([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public i()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
