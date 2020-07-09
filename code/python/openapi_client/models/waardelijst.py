# coding: utf-8

"""
    Kadastraal onroerende zaken

    D.m.v. deze toepassing worden meerdere, korte bevragingen op de Basis Registratie Kadaster beschikbaar gesteld. Deze toepassing betreft het verstrekken van Kadastrale Onroerende Zaak informatie.  # noqa: E501

    The version of the OpenAPI document: 1.0.0
    Generated by: https://openapi-generator.tech
"""


import pprint
import re  # noqa: F401

import six

from openapi_client.configuration import Configuration


class Waardelijst(object):
    """NOTE: This class is auto generated by OpenAPI Generator.
    Ref: https://openapi-generator.tech

    Do not edit the class manually.
    """

    """
    Attributes:
      openapi_types (dict): The key is attribute name
                            and the value is attribute type.
      attribute_map (dict): The key is attribute name
                            and the value is json key in definition.
    """
    openapi_types = {
        'code': 'str',
        'waarde': 'str'
    }

    attribute_map = {
        'code': 'code',
        'waarde': 'waarde'
    }

    def __init__(self, code=None, waarde=None, local_vars_configuration=None):  # noqa: E501
        """Waardelijst - a model defined in OpenAPI"""  # noqa: E501
        if local_vars_configuration is None:
            local_vars_configuration = Configuration()
        self.local_vars_configuration = local_vars_configuration

        self._code = None
        self._waarde = None
        self.discriminator = None

        if code is not None:
            self.code = code
        if waarde is not None:
            self.waarde = waarde

    @property
    def code(self):
        """Gets the code of this Waardelijst.  # noqa: E501


        :return: The code of this Waardelijst.  # noqa: E501
        :rtype: str
        """
        return self._code

    @code.setter
    def code(self, code):
        """Sets the code of this Waardelijst.


        :param code: The code of this Waardelijst.  # noqa: E501
        :type: str
        """
        if (self.local_vars_configuration.client_side_validation and
                code is not None and len(code) < 1):
            raise ValueError("Invalid value for `code`, length must be greater than or equal to `1`")  # noqa: E501

        self._code = code

    @property
    def waarde(self):
        """Gets the waarde of this Waardelijst.  # noqa: E501


        :return: The waarde of this Waardelijst.  # noqa: E501
        :rtype: str
        """
        return self._waarde

    @waarde.setter
    def waarde(self, waarde):
        """Sets the waarde of this Waardelijst.


        :param waarde: The waarde of this Waardelijst.  # noqa: E501
        :type: str
        """

        self._waarde = waarde

    def to_dict(self):
        """Returns the model properties as a dict"""
        result = {}

        for attr, _ in six.iteritems(self.openapi_types):
            value = getattr(self, attr)
            if isinstance(value, list):
                result[attr] = list(map(
                    lambda x: x.to_dict() if hasattr(x, "to_dict") else x,
                    value
                ))
            elif hasattr(value, "to_dict"):
                result[attr] = value.to_dict()
            elif isinstance(value, dict):
                result[attr] = dict(map(
                    lambda item: (item[0], item[1].to_dict())
                    if hasattr(item[1], "to_dict") else item,
                    value.items()
                ))
            else:
                result[attr] = value

        return result

    def to_str(self):
        """Returns the string representation of the model"""
        return pprint.pformat(self.to_dict())

    def __repr__(self):
        """For `print` and `pprint`"""
        return self.to_str()

    def __eq__(self, other):
        """Returns true if both objects are equal"""
        if not isinstance(other, Waardelijst):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, Waardelijst):
            return True

        return self.to_dict() != other.to_dict()