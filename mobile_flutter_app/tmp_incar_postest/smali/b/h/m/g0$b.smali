.class public final Lb/h/m/g0$b;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Lb/h/m/g0$f;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_11

    .line 3
    new-instance v0, Lb/h/m/g0$e;

    invoke-direct {v0}, Lb/h/m/g0$e;-><init>()V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    goto :goto_30

    :cond_11
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1d

    .line 4
    new-instance v0, Lb/h/m/g0$d;

    invoke-direct {v0}, Lb/h/m/g0$d;-><init>()V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    goto :goto_30

    :cond_1d
    const/16 v1, 0x14

    if-lt v0, v1, :cond_29

    .line 5
    new-instance v0, Lb/h/m/g0$c;

    invoke-direct {v0}, Lb/h/m/g0$c;-><init>()V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    goto :goto_30

    .line 6
    :cond_29
    new-instance v0, Lb/h/m/g0$f;

    invoke-direct {v0}, Lb/h/m/g0$f;-><init>()V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    :goto_30
    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;)V
    .registers 4

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_11

    .line 9
    new-instance v0, Lb/h/m/g0$e;

    invoke-direct {v0, p1}, Lb/h/m/g0$e;-><init>(Lb/h/m/g0;)V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    goto :goto_30

    :cond_11
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1d

    .line 10
    new-instance v0, Lb/h/m/g0$d;

    invoke-direct {v0, p1}, Lb/h/m/g0$d;-><init>(Lb/h/m/g0;)V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    goto :goto_30

    :cond_1d
    const/16 v1, 0x14

    if-lt v0, v1, :cond_29

    .line 11
    new-instance v0, Lb/h/m/g0$c;

    invoke-direct {v0, p1}, Lb/h/m/g0$c;-><init>(Lb/h/m/g0;)V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    goto :goto_30

    .line 12
    :cond_29
    new-instance v0, Lb/h/m/g0$f;

    invoke-direct {v0, p1}, Lb/h/m/g0$f;-><init>(Lb/h/m/g0;)V

    iput-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    :goto_30
    return-void
.end method


# virtual methods
.method public a(Lb/h/f/b;)Lb/h/m/g0$b;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    invoke-virtual {v0, p1}, Lb/h/m/g0$f;->b(Lb/h/f/b;)V

    return-object p0
.end method

.method public a()Lb/h/m/g0;
    .registers 2

    .line 2
    iget-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    invoke-virtual {v0}, Lb/h/m/g0$f;->b()Lb/h/m/g0;

    move-result-object v0

    return-object v0
.end method

.method public b(Lb/h/f/b;)Lb/h/m/g0$b;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/g0$b;->a:Lb/h/m/g0$f;

    invoke-virtual {v0, p1}, Lb/h/m/g0$f;->d(Lb/h/f/b;)V

    return-object p0
.end method
