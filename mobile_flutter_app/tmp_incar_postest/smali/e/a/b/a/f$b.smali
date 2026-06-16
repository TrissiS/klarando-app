.class public final Le/a/b/a/f$b;
.super Ljava/lang/Object;
.source "SignatureImpl.java"

# interfaces
.implements Le/a/b/a/f$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/a/b/a/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/ref/SoftReference;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p0}, Le/a/b/a/f$b;->b()[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(I)Ljava/lang/String;
    .registers 3

    .line 1
    invoke-virtual {p0}, Le/a/b/a/f$b;->a()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return-object p1

    .line 2
    :cond_8
    aget-object p1, v0, p1

    return-object p1
.end method

.method public a(ILjava/lang/String;)V
    .registers 4

    .line 3
    invoke-virtual {p0}, Le/a/b/a/f$b;->a()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    .line 4
    invoke-virtual {p0}, Le/a/b/a/f$b;->b()[Ljava/lang/String;

    move-result-object v0

    .line 5
    :cond_a
    aput-object p2, v0, p1

    return-void
.end method

.method public final a()[Ljava/lang/String;
    .registers 2

    .line 6
    iget-object v0, p0, Le/a/b/a/f$b;->a:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public final b()[Ljava/lang/String;
    .registers 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    .line 1
    new-instance v1, Ljava/lang/ref/SoftReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Le/a/b/a/f$b;->a:Ljava/lang/ref/SoftReference;

    return-object v0
.end method
