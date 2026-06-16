.class public Lc/b/a/f$b;
.super Ljava/lang/Object;
.source "EMUI3NavigationBarObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/b/a/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final a:Lc/b/a/f;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lc/b/a/f;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lc/b/a/f;-><init>(Lc/b/a/f$a;)V

    sput-object v0, Lc/b/a/f$b;->a:Lc/b/a/f;

    return-void
.end method

.method public static synthetic a()Lc/b/a/f;
    .registers 1

    .line 1
    sget-object v0, Lc/b/a/f$b;->a:Lc/b/a/f;

    return-object v0
.end method
