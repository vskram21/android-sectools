.class public Lorg/openintents/openpgp/OpenPgpError;
.super Ljava/lang/Object;
.source "OpenPgpError.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CLIENT_SIDE_ERROR:I = -0x1

.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/openintents/openpgp/OpenPgpError;",
            ">;"
        }
    .end annotation
.end field

.field public static final GENERIC_ERROR:I = 0x0

.field public static final INCOMPATIBLE_API_VERSIONS:I = 0x1

.field public static final NO_OR_WRONG_PASSPHRASE:I = 0x2

.field public static final NO_USER_IDS:I = 0x3

.field public static final PARCELABLE_VERSION:I = 0x1


# instance fields
.field errorId:I

.field message:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 98
    new-instance v0, Lorg/openintents/openpgp/OpenPgpError$1;

    invoke-direct {v0}, Lorg/openintents/openpgp/OpenPgpError$1;-><init>()V

    sput-object v0, Lorg/openintents/openpgp/OpenPgpError;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .parameter "errorId"
    .parameter "message"

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    .line 49
    iput-object p2, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/openintents/openpgp/OpenPgpError;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iget v0, p1, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    iput v0, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    .line 54
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method public getErrorId()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public setErrorId(I)V
    .locals 0
    .parameter "errorId"

    .prologue
    .line 62
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    .line 63
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 70
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4
    .parameter "dest"
    .parameter "flags"

    .prologue
    .line 82
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 86
    .local v1, sizePosition:I
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 89
    .local v2, startPosition:I
    iget v3, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 90
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 93
    .local v0, parcelableSize:I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 94
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 95
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 96
    return-void
.end method
