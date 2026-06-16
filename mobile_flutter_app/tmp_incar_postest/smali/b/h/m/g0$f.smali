.class public Lb/h/m/g0$f;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field public final a:Lb/h/m/g0;

.field public b:[Lb/h/f/b;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    new-instance v0, Lb/h/m/g0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lb/h/m/g0;-><init>(Lb/h/m/g0;)V

    invoke-direct {p0, v0}, Lb/h/m/g0$f;-><init>(Lb/h/m/g0;)V

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;)V
    .registers 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lb/h/m/g0$f;->a:Lb/h/m/g0;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/g0$f;->b:[Lb/h/f/b;

    if-eqz v0, :cond_58

    const/4 v1, 0x1

    .line 2
    invoke-static {v1}, Lb/h/m/g0$m;->a(I)I

    move-result v1

    aget-object v0, v0, v1

    .line 3
    iget-object v1, p0, Lb/h/m/g0$f;->b:[Lb/h/f/b;

    const/4 v2, 0x2

    invoke-static {v2}, Lb/h/m/g0$m;->a(I)I

    move-result v2

    aget-object v1, v1, v2

    if-eqz v0, :cond_20

    if-eqz v1, :cond_20

    .line 4
    invoke-static {v0, v1}, Lb/h/f/b;->a(Lb/h/f/b;Lb/h/f/b;)Lb/h/f/b;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/h/m/g0$f;->d(Lb/h/f/b;)V

    goto :goto_2b

    :cond_20
    if-eqz v0, :cond_26

    .line 5
    invoke-virtual {p0, v0}, Lb/h/m/g0$f;->d(Lb/h/f/b;)V

    goto :goto_2b

    :cond_26
    if-eqz v1, :cond_2b

    .line 6
    invoke-virtual {p0, v1}, Lb/h/m/g0$f;->d(Lb/h/f/b;)V

    .line 7
    :cond_2b
    :goto_2b
    iget-object v0, p0, Lb/h/m/g0$f;->b:[Lb/h/f/b;

    const/16 v1, 0x10

    invoke-static {v1}, Lb/h/m/g0$m;->a(I)I

    move-result v1

    aget-object v0, v0, v1

    if-eqz v0, :cond_3a

    .line 8
    invoke-virtual {p0, v0}, Lb/h/m/g0$f;->c(Lb/h/f/b;)V

    .line 9
    :cond_3a
    iget-object v0, p0, Lb/h/m/g0$f;->b:[Lb/h/f/b;

    const/16 v1, 0x20

    invoke-static {v1}, Lb/h/m/g0$m;->a(I)I

    move-result v1

    aget-object v0, v0, v1

    if-eqz v0, :cond_49

    .line 10
    invoke-virtual {p0, v0}, Lb/h/m/g0$f;->a(Lb/h/f/b;)V

    .line 11
    :cond_49
    iget-object v0, p0, Lb/h/m/g0$f;->b:[Lb/h/f/b;

    const/16 v1, 0x40

    invoke-static {v1}, Lb/h/m/g0$m;->a(I)I

    move-result v1

    aget-object v0, v0, v1

    if-eqz v0, :cond_58

    .line 12
    invoke-virtual {p0, v0}, Lb/h/m/g0$f;->e(Lb/h/f/b;)V

    :cond_58
    return-void
.end method

.method public a(Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public b()Lb/h/m/g0;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/h/m/g0$f;->a()V

    .line 2
    iget-object v0, p0, Lb/h/m/g0$f;->a:Lb/h/m/g0;

    return-object v0
.end method

.method public b(Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public c(Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public d(Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public e(Lb/h/f/b;)V
    .registers 2

    return-void
.end method
