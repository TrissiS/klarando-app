.class public Ld/a/b/g/l/c/c$a;
.super Ljava/lang/Object;
.source "CheckWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/c/c;->b(Ld/a/b/g/l/f/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ld/a/b/g/l/f/b;

.field public final synthetic i:Ld/a/b/g/l/c/c;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/c/c;Ld/a/b/g/l/f/b;)V
    .registers 3

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/c/c$a;->i:Ld/a/b/g/l/c/c;

    iput-object p2, p0, Ld/a/b/g/l/c/c$a;->h:Ld/a/b/g/l/f/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/c$a;->i:Ld/a/b/g/l/c/c;

    invoke-static {v0}, Ld/a/b/g/l/c/c;->a(Ld/a/b/g/l/c/c;)Ld/a/b/g/l/d/b;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/c/c$a;->i:Ld/a/b/g/l/c/c;

    invoke-static {v0}, Ld/a/b/g/l/c/c;->a(Ld/a/b/g/l/c/c;)Ld/a/b/g/l/d/b;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/c$a;->h:Ld/a/b/g/l/f/b;

    invoke-virtual {v0, v1}, Ld/a/b/g/l/d/b;->a(Ld/a/b/g/l/f/b;)V

    return-void
.end method
