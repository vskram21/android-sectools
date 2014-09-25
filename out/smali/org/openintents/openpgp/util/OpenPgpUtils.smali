.class public Lorg/openintents/openpgp/util/OpenPgpUtils;
.super Ljava/lang/Object;
.source "OpenPgpUtils.java"


# static fields
.field public static final PARSE_RESULT_MESSAGE:I = 0x0

.field public static final PARSE_RESULT_NO_PGP:I = -0x1

.field public static final PARSE_RESULT_SIGNED_MESSAGE:I = 0x1

.field public static final PGP_MESSAGE:Ljava/util/regex/Pattern;

.field public static final PGP_SIGNED_MESSAGE:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x20

    .line 30
    const-string v0, ".*?(-----BEGIN PGP MESSAGE-----.*?-----END PGP MESSAGE-----).*"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/openintents/openpgp/util/OpenPgpUtils;->PGP_MESSAGE:Ljava/util/regex/Pattern;

    .line 34
    const-string v0, ".*?(-----BEGIN PGP SIGNED MESSAGE-----.*?-----BEGIN PGP SIGNATURE-----.*?-----END PGP SIGNATURE-----).*"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/openintents/openpgp/util/OpenPgpUtils;->PGP_SIGNED_MESSAGE:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertKeyIdToHex(J)Ljava/lang/String;
    .locals 3
    .parameter "keyId"

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    shr-long v1, p0, v1

    invoke-static {v1, v2}, Lorg/openintents/openpgp/util/OpenPgpUtils;->convertKeyIdToHex32bit(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0, p1}, Lorg/openintents/openpgp/util/OpenPgpUtils;->convertKeyIdToHex32bit(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static convertKeyIdToHex32bit(J)Ljava/lang/String;
    .locals 3
    .parameter "keyId"

    .prologue
    .line 70
    const-wide v1, 0xffffffffL

    and-long/2addr v1, p0

    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, hexString:Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x8

    if-ge v1, v2, :cond_0

    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 74
    :cond_0
    return-object v0
.end method

.method public static isAvailable(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 56
    new-instance v0, Landroid/content/Intent;

    const-string v3, "org.openintents.openpgp.IOpenPgpService"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 57
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 58
    .local v1, resInfo:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 59
    const/4 v2, 0x1

    .line 61
    :cond_0
    return v2
.end method

.method public static parseMessage(Ljava/lang/String;)I
    .locals 3
    .parameter "message"

    .prologue
    .line 43
    sget-object v2, Lorg/openintents/openpgp/util/OpenPgpUtils;->PGP_SIGNED_MESSAGE:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 44
    .local v1, matcherSigned:Ljava/util/regex/Matcher;
    sget-object v2, Lorg/openintents/openpgp/util/OpenPgpUtils;->PGP_MESSAGE:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 46
    .local v0, matcherMessage:Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    const/4 v2, 0x0

    .line 51
    :goto_0
    return v2

    .line 48
    :cond_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 49
    const/4 v2, 0x1

    goto :goto_0

    .line 51
    :cond_1
    const/4 v2, -0x1

    goto :goto_0
.end method
