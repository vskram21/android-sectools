.class final Lorg/openintents/openpgp/OpenPgpMetadata$1;
.super Ljava/lang/Object;
.source "OpenPgpMetadata.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/OpenPgpMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lorg/openintents/openpgp/OpenPgpMetadata;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpMetadata$1;->createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpMetadata;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpMetadata;
    .locals 6
    .parameter "source"

    .prologue
    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 103
    .local v1, parcelableVersion:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 104
    .local v0, parcelableSize:I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 106
    .local v2, startPosition:I
    new-instance v3, Lorg/openintents/openpgp/OpenPgpMetadata;

    invoke-direct {v3}, Lorg/openintents/openpgp/OpenPgpMetadata;-><init>()V

    .line 107
    .local v3, vr:Lorg/openintents/openpgp/OpenPgpMetadata;
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    .line 108
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    .line 109
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, v3, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    .line 110
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, v3, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    .line 113
    add-int v4, v2, v0

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 115
    return-object v3
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpMetadata$1;->newArray(I)[Lorg/openintents/openpgp/OpenPgpMetadata;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/openintents/openpgp/OpenPgpMetadata;
    .locals 1
    .parameter "size"

    .prologue
    .line 119
    new-array v0, p1, [Lorg/openintents/openpgp/OpenPgpMetadata;

    return-object v0
.end method
