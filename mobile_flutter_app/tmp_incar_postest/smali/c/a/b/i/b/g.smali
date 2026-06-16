.class public abstract Lc/a/b/i/b/g;
.super Ljava/lang/Object;
.source "Token.java"


# static fields
.field public static final b:Lc/a/b/i/b/g;


# instance fields
.field public final a:Lc/a/b/i/b/g;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Lc/a/b/i/b/e;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v1}, Lc/a/b/i/b/e;-><init>(Lc/a/b/i/b/g;II)V

    sput-object v0, Lc/a/b/i/b/g;->b:Lc/a/b/i/b/g;

    return-void
.end method

.method public constructor <init>(Lc/a/b/i/b/g;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/b/i/b/g;->a:Lc/a/b/i/b/g;

    return-void
.end method


# virtual methods
.method public final a()Lc/a/b/i/b/g;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/b/i/b/g;->a:Lc/a/b/i/b/g;

    return-object v0
.end method

.method public final a(II)Lc/a/b/i/b/g;
    .registers 4

    .line 2
    new-instance v0, Lc/a/b/i/b/e;

    invoke-direct {v0, p0, p1, p2}, Lc/a/b/i/b/e;-><init>(Lc/a/b/i/b/g;II)V

    return-object v0
.end method

.method public abstract a(Lc/a/b/j/a;[B)V
.end method

.method public final b(II)Lc/a/b/i/b/g;
    .registers 4

    .line 1
    new-instance v0, Lc/a/b/i/b/b;

    invoke-direct {v0, p0, p1, p2}, Lc/a/b/i/b/b;-><init>(Lc/a/b/i/b/g;II)V

    return-object v0
.end method
