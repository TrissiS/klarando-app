.class public Lb/l/d/w$b;
.super Ljava/lang/Object;
.source "SpecialEffectsController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/w;->a(Lb/l/d/w$e$c;Lb/l/d/w$e$b;Lb/l/d/o;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/w$d;

.field public final synthetic i:Lb/l/d/w;


# direct methods
.method public constructor <init>(Lb/l/d/w;Lb/l/d/w$d;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/l/d/w$b;->i:Lb/l/d/w;

    iput-object p2, p0, Lb/l/d/w$b;->h:Lb/l/d/w$d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/w$b;->i:Lb/l/d/w;

    iget-object v0, v0, Lb/l/d/w;->b:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/l/d/w$b;->h:Lb/l/d/w$d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2
    iget-object v0, p0, Lb/l/d/w$b;->i:Lb/l/d/w;

    iget-object v0, v0, Lb/l/d/w;->c:Ljava/util/ArrayList;

    iget-object v1, p0, Lb/l/d/w$b;->h:Lb/l/d/w$d;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
