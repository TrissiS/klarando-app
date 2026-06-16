.class public abstract Ld/a/b/g/l/c/e;
.super Ljava/lang/Object;
.source "DownloadNotifier.java"


# instance fields
.field public a:Ld/a/b/g/l/f/b;

.field public b:Ld/a/b/g/l/a;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a(Ld/a/b/g/l/f/b;Landroid/app/Activity;)Ld/a/b/g/l/c/d;
.end method

.method public final a(Ld/a/b/g/l/a;Ld/a/b/g/l/f/b;)Ld/a/b/g/l/c/e;
    .registers 3

    .line 1
    iput-object p2, p0, Ld/a/b/g/l/c/e;->a:Ld/a/b/g/l/f/b;

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/c/e;->b:Ld/a/b/g/l/a;

    return-object p0
.end method

.method public final a()V
    .registers 4

    .line 3
    invoke-static {}, Ld/a/b/g/l/d/d;->a()Ld/a/b/g/l/d/d;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/e;->a:Ld/a/b/g/l/f/b;

    iget-object v2, p0, Ld/a/b/g/l/c/e;->b:Ld/a/b/g/l/a;

    invoke-virtual {v0, v1, v2}, Ld/a/b/g/l/d/d;->a(Ld/a/b/g/l/f/b;Ld/a/b/g/l/a;)V

    return-void
.end method
