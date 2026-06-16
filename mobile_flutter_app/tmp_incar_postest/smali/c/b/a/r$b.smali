.class public Lc/b/a/r$b;
.super Ljava/lang/Object;
.source "RequestManagerRetriever.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/b/a/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final a:Lc/b/a/r;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lc/b/a/r;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lc/b/a/r;-><init>(Lc/b/a/r$a;)V

    sput-object v0, Lc/b/a/r$b;->a:Lc/b/a/r;

    return-void
.end method

.method public static synthetic a()Lc/b/a/r;
    .registers 1

    .line 1
    sget-object v0, Lc/b/a/r$b;->a:Lc/b/a/r;

    return-object v0
.end method
