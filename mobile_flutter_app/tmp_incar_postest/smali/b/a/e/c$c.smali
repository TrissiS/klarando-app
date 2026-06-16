.class public Lb/a/e/c$c;
.super Ljava/lang/Object;
.source "ActivityResultRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/e/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:Lb/n/e;

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/n/f;",
            ">;"
        }
    .end annotation
.end field


# virtual methods
.method public a()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/a/e/c$c;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/n/f;

    .line 2
    iget-object v2, p0, Lb/a/e/c$c;->a:Lb/n/e;

    invoke-virtual {v2, v1}, Lb/n/e;->b(Lb/n/g;)V

    goto :goto_6

    .line 3
    :cond_18
    iget-object v0, p0, Lb/a/e/c$c;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method
