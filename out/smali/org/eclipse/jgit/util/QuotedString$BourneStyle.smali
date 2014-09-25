.class public Lorg/eclipse/jgit/util/QuotedString$BourneStyle;
.super Lorg/eclipse/jgit/util/QuotedString;
.source "QuotedString.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/QuotedString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BourneStyle"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 136
    invoke-direct {p0}, Lorg/eclipse/jgit/util/QuotedString;-><init>()V

    return-void
.end method


# virtual methods
.method public dequote([BII)Ljava/lang/String;
    .locals 8
    .parameter "in"
    .parameter "ip"
    .parameter "ie"

    .prologue
    const/4 v6, 0x0

    .line 162
    const/4 v1, 0x0

    .line 163
    .local v1, inquote:Z
    sub-int v7, p3, p2

    new-array v3, v7, [B

    .line 164
    .local v3, r:[B
    const/4 v4, 0x0

    .local v4, rPtr:I
    move v5, v4

    .end local v4           #rPtr:I
    .local v5, rPtr:I
    move v2, p2

    .line 165
    .end local p2
    .local v2, ip:I
    :goto_0
    if-ge v2, p3, :cond_3

    .line 166
    add-int/lit8 p2, v2, 0x1

    .end local v2           #ip:I
    .restart local p2
    aget-byte v0, p1, v2

    .line 167
    .local v0, b:B
    sparse-switch v0, :sswitch_data_0

    .line 178
    add-int/lit8 v4, v5, 0x1

    .end local v5           #rPtr:I
    .restart local v4       #rPtr:I
    aput-byte v0, v3, v5

    move v5, v4

    .end local v4           #rPtr:I
    .restart local v5       #rPtr:I
    move v2, p2

    .line 179
    .end local p2
    .restart local v2       #ip:I
    goto :goto_0

    .line 169
    .end local v2           #ip:I
    .restart local p2
    :sswitch_0
    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_1
    move v2, p2

    .line 170
    .end local p2
    .restart local v2       #ip:I
    goto :goto_0

    .end local v2           #ip:I
    .restart local p2
    :cond_0
    move v1, v6

    .line 169
    goto :goto_1

    .line 172
    :sswitch_1
    if-nez v1, :cond_1

    if-ne p2, p3, :cond_2

    .line 173
    :cond_1
    add-int/lit8 v4, v5, 0x1

    .end local v5           #rPtr:I
    .restart local v4       #rPtr:I
    aput-byte v0, v3, v5

    move v5, v4

    .end local v4           #rPtr:I
    .restart local v5       #rPtr:I
    move v2, p2

    .end local p2
    .restart local v2       #ip:I
    goto :goto_0

    .line 175
    .end local v2           #ip:I
    .restart local p2
    :cond_2
    add-int/lit8 v4, v5, 0x1

    .end local v5           #rPtr:I
    .restart local v4       #rPtr:I
    add-int/lit8 v2, p2, 0x1

    .end local p2
    .restart local v2       #ip:I
    aget-byte v7, p1, p2

    aput-byte v7, v3, v5

    move v5, v4

    .line 176
    .end local v4           #rPtr:I
    .restart local v5       #rPtr:I
    goto :goto_0

    .line 182
    .end local v0           #b:B
    :cond_3
    sget-object v7, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v7, v3, v6, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 167
    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_0
        0x5c -> :sswitch_1
    .end sparse-switch
.end method

.method public quote(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "in"

    .prologue
    const/16 v4, 0x27

    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .local v1, r:Ljava/lang/StringBuilder;
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 141
    const/4 v2, 0x0

    .local v2, start:I
    const/4 v0, 0x0

    .line 142
    .local v0, i:I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 143
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 142
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 146
    :sswitch_0
    invoke-virtual {v1, p1, v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 147
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 148
    const/16 v3, 0x5c

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 150
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    add-int/lit8 v2, v0, 0x1

    goto :goto_1

    .line 155
    :cond_0
    invoke-virtual {v1, p1, v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 157
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 143
    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x27 -> :sswitch_0
    .end sparse-switch
.end method
