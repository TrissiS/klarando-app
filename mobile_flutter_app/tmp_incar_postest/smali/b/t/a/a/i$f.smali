.class public abstract Lb/t/a/a/i$f;
.super Lb/t/a/a/i$e;
.source "VectorDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/t/a/a/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "f"
.end annotation


# instance fields
.field public a:[Lb/h/f/c$b;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lb/t/a/a/i$e;-><init>(Lb/t/a/a/i$a;)V

    .line 2
    iput-object v0, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lb/t/a/a/i$f;->c:I

    return-void
.end method

.method public constructor <init>(Lb/t/a/a/i$f;)V
    .registers 3

    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lb/t/a/a/i$e;-><init>(Lb/t/a/a/i$a;)V

    .line 5
    iput-object v0, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lb/t/a/a/i$f;->c:I

    .line 7
    iget-object v0, p1, Lb/t/a/a/i$f;->b:Ljava/lang/String;

    iput-object v0, p0, Lb/t/a/a/i$f;->b:Ljava/lang/String;

    .line 8
    iget v0, p1, Lb/t/a/a/i$f;->d:I

    iput v0, p0, Lb/t/a/a/i$f;->d:I

    .line 9
    iget-object p1, p1, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    invoke-static {p1}, Lb/h/f/c;->a([Lb/h/f/c$b;)[Lb/h/f/c$b;

    move-result-object p1

    iput-object p1, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Path;)V
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 2
    iget-object v0, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    if-eqz v0, :cond_a

    .line 3
    invoke-static {v0, p1}, Lb/h/f/c$b;->a([Lb/h/f/c$b;Landroid/graphics/Path;)V

    :cond_a
    return-void
.end method

.method public b()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getPathData()[Lb/h/f/c$b;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    return-object v0
.end method

.method public getPathName()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/i$f;->b:Ljava/lang/String;

    return-object v0
.end method

.method public setPathData([Lb/h/f/c$b;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    invoke-static {v0, p1}, Lb/h/f/c;->a([Lb/h/f/c$b;[Lb/h/f/c$b;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 2
    invoke-static {p1}, Lb/h/f/c;->a([Lb/h/f/c$b;)[Lb/h/f/c$b;

    move-result-object p1

    iput-object p1, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    goto :goto_14

    .line 3
    :cond_f
    iget-object v0, p0, Lb/t/a/a/i$f;->a:[Lb/h/f/c$b;

    invoke-static {v0, p1}, Lb/h/f/c;->b([Lb/h/f/c$b;[Lb/h/f/c$b;)V

    :goto_14
    return-void
.end method
