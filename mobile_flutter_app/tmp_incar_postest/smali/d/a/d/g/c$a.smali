.class public Ld/a/d/g/c$a;
.super Ljava/lang/Object;
.source "HiGuide.java"

# interfaces
.implements Ld/a/d/g/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/d/g/c;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ld/a/d/g/c;


# direct methods
.method public constructor <init>(Ld/a/d/g/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/d/g/c$a;->a:Ld/a/d/g/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/d/g/c$a;->a:Ld/a/d/g/c;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ld/a/d/g/c;->a(Ld/a/d/g/c;Ld/a/d/g/b;)Ld/a/d/g/b;

    .line 2
    iget-object v0, p0, Ld/a/d/g/c$a;->a:Ld/a/d/g/c;

    invoke-static {v0}, Ld/a/d/g/c;->a(Ld/a/d/g/c;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 3
    iget-object v0, p0, Ld/a/d/g/c$a;->a:Ld/a/d/g/c;

    invoke-static {v0}, Ld/a/d/g/c;->b(Ld/a/d/g/c;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 4
    iget-object v0, p0, Ld/a/d/g/c$a;->a:Ld/a/d/g/c;

    invoke-virtual {v0}, Ld/a/d/g/c;->b()V

    :cond_1d
    return-void
.end method
