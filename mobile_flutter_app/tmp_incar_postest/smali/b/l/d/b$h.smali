.class public Lb/l/d/b$h;
.super Ljava/lang/Object;
.source "DefaultSpecialEffectsController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/b;->a(Ljava/util/List;Ljava/util/List;ZLb/l/d/w$e;Lb/l/d/w$e;)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/t;

.field public final synthetic i:Landroid/view/View;

.field public final synthetic j:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lb/l/d/b;Lb/l/d/t;Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 5

    .line 1
    iput-object p2, p0, Lb/l/d/b$h;->h:Lb/l/d/t;

    iput-object p3, p0, Lb/l/d/b$h;->i:Landroid/view/View;

    iput-object p4, p0, Lb/l/d/b$h;->j:Landroid/graphics/Rect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/l/d/b$h;->h:Lb/l/d/t;

    iget-object v1, p0, Lb/l/d/b$h;->i:Landroid/view/View;

    iget-object v2, p0, Lb/l/d/b$h;->j:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v2}, Lb/l/d/t;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    return-void
.end method
