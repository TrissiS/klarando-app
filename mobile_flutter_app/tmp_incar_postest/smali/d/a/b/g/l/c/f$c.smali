.class public Ld/a/b/g/l/c/f$c;
.super Ljava/lang/Object;
.source "DownloadWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/c/f;->b(Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ljava/io/File;

.field public final synthetic i:Ld/a/b/g/l/c/f;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/c/f;Ljava/io/File;)V
    .registers 3

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/c/f$c;->i:Ld/a/b/g/l/c/f;

    iput-object p2, p0, Ld/a/b/g/l/c/f$c;->h:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/f$c;->i:Ld/a/b/g/l/c/f;

    invoke-static {v0}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/c/f;)Ld/a/b/g/l/d/c;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/c/f$c;->i:Ld/a/b/g/l/c/f;

    invoke-static {v0}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/c/f;)Ld/a/b/g/l/d/c;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/f$c;->h:Ljava/io/File;

    invoke-virtual {v0, v1}, Ld/a/b/g/l/d/c;->a(Ljava/io/File;)V

    .line 3
    iget-object v0, p0, Ld/a/b/g/l/c/f$c;->i:Ld/a/b/g/l/c/f;

    invoke-static {v0}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/c/f;)Ld/a/b/g/l/d/c;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/f$c;->h:Ljava/io/File;

    invoke-virtual {v0, v1}, Ld/a/b/g/l/d/c;->b(Ljava/io/File;)V

    .line 4
    invoke-static {}, Ld/a/b/g/l/c/f;->b()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/f$c;->i:Ld/a/b/g/l/c/f;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
