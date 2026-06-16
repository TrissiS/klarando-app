.class public Lc/b/a/k$b;
.super Ljava/lang/Object;
.source "NavigationBarObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/b/a/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final a:Lc/b/a/k;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lc/b/a/k;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lc/b/a/k;-><init>(Lc/b/a/k$a;)V

    sput-object v0, Lc/b/a/k$b;->a:Lc/b/a/k;

    return-void
.end method

.method public static synthetic a()Lc/b/a/k;
    .registers 1

    .line 1
    sget-object v0, Lc/b/a/k$b;->a:Lc/b/a/k;

    return-object v0
.end method
