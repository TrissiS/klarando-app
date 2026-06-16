.class public Ld/a/b/g/l/d/c$a;
.super Ljava/lang/Object;
.source "DefaultDownloadCallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/d/c;->b(Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ld/a/b/g/l/a;

.field public final synthetic i:Ljava/io/File;

.field public final synthetic j:Ld/a/b/g/l/d/c;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/d/c;Ld/a/b/g/l/a;Ljava/io/File;)V
    .registers 4

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/d/c$a;->j:Ld/a/b/g/l/d/c;

    iput-object p2, p0, Ld/a/b/g/l/d/c$a;->h:Ld/a/b/g/l/a;

    iput-object p3, p0, Ld/a/b/g/l/d/c$a;->i:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/d/c$a;->h:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->l()Ld/a/b/g/l/c/i;

    move-result-object v0

    .line 2
    iget-object v1, p0, Ld/a/b/g/l/d/c$a;->h:Ld/a/b/g/l/a;

    invoke-virtual {v0, v1}, Ld/a/b/g/l/c/i;->a(Ld/a/b/g/l/a;)V

    .line 3
    iget-object v1, p0, Ld/a/b/g/l/d/c$a;->j:Ld/a/b/g/l/d/c;

    invoke-static {v1}, Ld/a/b/g/l/d/c;->a(Ld/a/b/g/l/d/c;)Ld/a/b/g/l/f/b;

    move-result-object v1

    invoke-virtual {v0, v1}, Ld/a/b/g/l/c/i;->a(Ld/a/b/g/l/f/b;)V

    .line 4
    iget-object v1, p0, Ld/a/b/g/l/d/c$a;->i:Ljava/io/File;

    invoke-virtual {v0, v1}, Ld/a/b/g/l/c/i;->a(Ljava/io/File;)V

    .line 5
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v1

    invoke-virtual {v1}, Ld/a/b/g/l/g/a;->c()Landroid/app/Activity;

    move-result-object v1

    .line 6
    invoke-static {v1}, Ld/a/b/g/l/g/e;->a(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_45

    iget-object v2, p0, Ld/a/b/g/l/d/c$a;->j:Ld/a/b/g/l/d/c;

    .line 7
    invoke-static {v2}, Ld/a/b/g/l/d/c;->b(Ld/a/b/g/l/d/c;)Ld/a/b/g/l/a;

    move-result-object v2

    invoke-virtual {v2}, Ld/a/b/g/l/a;->p()Ld/a/b/g/l/c/n;

    move-result-object v2

    invoke-virtual {v2}, Ld/a/b/g/l/c/n;->a()Z

    move-result v2

    if-nez v2, :cond_45

    .line 8
    invoke-virtual {v0, v1}, Ld/a/b/g/l/c/i;->a(Landroid/app/Activity;)Landroid/app/Dialog;

    move-result-object v1

    if-eqz v1, :cond_41

    .line 9
    invoke-static {v1}, Ld/a/b/g/l/g/c;->c(Landroid/app/Dialog;)V

    goto :goto_48

    .line 10
    :cond_41
    invoke-virtual {v0}, Ld/a/b/g/l/c/i;->b()V

    goto :goto_48

    .line 11
    :cond_45
    invoke-virtual {v0}, Ld/a/b/g/l/c/i;->b()V

    :goto_48
    return-void
.end method
