.class public Lb/h/j/a$a;
.super Ljava/lang/Object;
.source "CallbackWithHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/j/a;->a(Landroid/graphics/Typeface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/h/j/f$c;

.field public final synthetic i:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Lb/h/j/a;Lb/h/j/f$c;Landroid/graphics/Typeface;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lb/h/j/a$a;->h:Lb/h/j/f$c;

    iput-object p3, p0, Lb/h/j/a$a;->i:Landroid/graphics/Typeface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/j/a$a;->h:Lb/h/j/f$c;

    iget-object v1, p0, Lb/h/j/a$a;->i:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Lb/h/j/f$c;->a(Landroid/graphics/Typeface;)V

    return-void
.end method
