.class public Ld/a/b/g/l/c/f$b;
.super Ljava/lang/Object;
.source "DownloadWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/c/f;->a(JJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:J

.field public final synthetic i:J

.field public final synthetic j:Ld/a/b/g/l/c/f;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/c/f;JJ)V
    .registers 6

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/c/f$b;->j:Ld/a/b/g/l/c/f;

    iput-wide p2, p0, Ld/a/b/g/l/c/f$b;->h:J

    iput-wide p4, p0, Ld/a/b/g/l/c/f$b;->i:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/f$b;->j:Ld/a/b/g/l/c/f;

    invoke-static {v0}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/c/f;)Ld/a/b/g/l/d/c;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/c/f$b;->j:Ld/a/b/g/l/c/f;

    invoke-static {v0}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/c/f;)Ld/a/b/g/l/d/c;

    move-result-object v0

    iget-wide v1, p0, Ld/a/b/g/l/c/f$b;->h:J

    iget-wide v3, p0, Ld/a/b/g/l/c/f$b;->i:J

    invoke-virtual {v0, v1, v2, v3, v4}, Ld/a/b/g/l/d/c;->a(JJ)V

    return-void
.end method
