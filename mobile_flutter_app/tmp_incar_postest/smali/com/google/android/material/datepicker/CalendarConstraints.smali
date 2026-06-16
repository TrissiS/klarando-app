.class public final Lcom/google/android/material/datepicker/CalendarConstraints;
.super Ljava/lang/Object;
.source "CalendarConstraints.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/datepicker/CalendarConstraints$b;,
        Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/material/datepicker/CalendarConstraints;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final h:Lcom/google/android/material/datepicker/Month;

.field public final i:Lcom/google/android/material/datepicker/Month;

.field public final j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

.field public k:Lcom/google/android/material/datepicker/Month;

.field public final l:I

.field public final m:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lcom/google/android/material/datepicker/CalendarConstraints$a;

    invoke-direct {v0}, Lcom/google/android/material/datepicker/CalendarConstraints$a;-><init>()V

    sput-object v0, Lcom/google/android/material/datepicker/CalendarConstraints;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;Lcom/google/android/material/datepicker/Month;)V
    .registers 5

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    .line 4
    iput-object p2, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    .line 5
    iput-object p4, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->k:Lcom/google/android/material/datepicker/Month;

    .line 6
    iput-object p3, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    if-eqz p4, :cond_1c

    .line 7
    invoke-virtual {p1, p4}, Lcom/google/android/material/datepicker/Month;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result p3

    if-gtz p3, :cond_14

    goto :goto_1c

    .line 8
    :cond_14
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "start Month cannot be after current Month"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1c
    :goto_1c
    if-eqz p4, :cond_2d

    .line 9
    invoke-virtual {p4, p2}, Lcom/google/android/material/datepicker/Month;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result p3

    if-gtz p3, :cond_25

    goto :goto_2d

    .line 10
    :cond_25
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "current Month cannot be after end Month"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 11
    :cond_2d
    :goto_2d
    invoke-virtual {p1, p2}, Lcom/google/android/material/datepicker/Month;->b(Lcom/google/android/material/datepicker/Month;)I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    iput p3, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->m:I

    .line 12
    iget p2, p2, Lcom/google/android/material/datepicker/Month;->j:I

    iget p1, p1, Lcom/google/android/material/datepicker/Month;->j:I

    sub-int/2addr p2, p1

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->l:I

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/CalendarConstraints$a;)V
    .registers 6

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/material/datepicker/CalendarConstraints;-><init>(Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;Lcom/google/android/material/datepicker/Month;)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/datepicker/CalendarConstraints;)Lcom/google/android/material/datepicker/Month;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/material/datepicker/CalendarConstraints;)Lcom/google/android/material/datepicker/Month;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    return-object p0
.end method

.method public static synthetic c(Lcom/google/android/material/datepicker/CalendarConstraints;)Lcom/google/android/material/datepicker/Month;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->k:Lcom/google/android/material/datepicker/Month;

    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/material/datepicker/CalendarConstraints;)Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    return-object p0
.end method


# virtual methods
.method public a(Lcom/google/android/material/datepicker/Month;)Lcom/google/android/material/datepicker/Month;
    .registers 3

    .line 2
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/Month;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result v0

    if-gez v0, :cond_b

    .line 3
    iget-object p1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    return-object p1

    .line 4
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/Month;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result v0

    if-lez v0, :cond_15

    .line 5
    iget-object p1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    :cond_15
    return-object p1
.end method

.method public c(J)Z
    .registers 7

    .line 2
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/material/datepicker/Month;->a(I)J

    move-result-wide v2

    cmp-long v0, v2, p1

    if-gtz v0, :cond_18

    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    iget v2, v0, Lcom/google/android/material/datepicker/Month;->l:I

    invoke-virtual {v0, v2}, Lcom/google/android/material/datepicker/Month;->a(I)J

    move-result-wide v2

    cmp-long v0, p1, v2

    if-gtz v0, :cond_18

    goto :goto_19

    :cond_18
    const/4 v1, 0x0

    :goto_19
    return v1
.end method

.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public e()Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 1
    :cond_4
    instance-of v1, p1, Lcom/google/android/material/datepicker/CalendarConstraints;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 2
    :cond_a
    check-cast p1, Lcom/google/android/material/datepicker/CalendarConstraints;

    .line 3
    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    iget-object v3, p1, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v1, v3}, Lcom/google/android/material/datepicker/Month;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    iget-object v3, p1, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    .line 4
    invoke-virtual {v1, v3}, Lcom/google/android/material/datepicker/Month;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->k:Lcom/google/android/material/datepicker/Month;

    iget-object v3, p1, Lcom/google/android/material/datepicker/CalendarConstraints;->k:Lcom/google/android/material/datepicker/Month;

    .line 5
    invoke-static {v1, v3}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    iget-object p1, p1, Lcom/google/android/material/datepicker/CalendarConstraints;->j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    .line 6
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_35

    goto :goto_36

    :cond_35
    const/4 v0, 0x0

    :goto_36
    return v0
.end method

.method public f()Lcom/google/android/material/datepicker/Month;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    return-object v0
.end method

.method public g()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->m:I

    return v0
.end method

.method public h()Lcom/google/android/material/datepicker/Month;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->k:Lcom/google/android/material/datepicker/Month;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->k:Lcom/google/android/material/datepicker/Month;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 2
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public i()Lcom/google/android/material/datepicker/Month;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    return-object v0
.end method

.method public j()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->l:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    .line 1
    iget-object p2, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->h:Lcom/google/android/material/datepicker/Month;

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 2
    iget-object p2, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->i:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 3
    iget-object p2, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->k:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 4
    iget-object p2, p0, Lcom/google/android/material/datepicker/CalendarConstraints;->j:Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
